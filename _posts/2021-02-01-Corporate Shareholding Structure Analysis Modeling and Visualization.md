---
layout: post
title:  "Corporate Shareholding Structure Analysis Modeling and Visualization"
date:   2021-02-01
tags: [time2]
---
# Introduction
---
For the analysis of governance risk in ESG consulting for business strategies and subsidiaries, it's essential to understand the shareholding structure of the group companies. However, for large group companies with very complex ownership structures, a simple schematic of shareholdings is not sufficient for analysis.

Moreover, in the shareholding structure, there exists **indirect ownership, which is not covered in standard graph theory's Centrality**.

Considering these factors, this project aims to extract numerical results for desired insights through the shareholding structure data of group companies with complex ownership structures. It also focuses on modeling to easily understand the relationships between the constituent companies. Finally, this model is visualized effectively to be utilized in forming business strategies and consulting.

<br>

# Methodology
---
In this post, Samsung Group is taken as an example. The shareholding structure of Samsung Group is as follows:
<p align="center">
    <img width="800" src="/assets/2020/shareholding/samsung_structure.png">
</p>

Initially, a network theory-based model was designed, but the visibility was very poor due to complexity when visualized. Therefore, the network theory-based model was revised for visualization in the hexbin style.

In the Methodology Section, the following two models are explained:

1. Design of a network theory-based model
2. Model improvement for hexbin-based visualization

<br>
<br>


## 1. Design of a network theory-based model
---
## Setting

$$V$$ is set of nodes.   
$$E \subseteq \{(x,y) | (x,y)\in V^2, x \neq y\}$$   
$$\mathcal{A} \in M_{m \times n}(\mathbb{R})$$ is the adjacency matrix.    
$$\mathcal{W} \in M_{m \times n}(\mathbb{R})$$ is the edge weight matrix. (edge weight = ownership rate)    
where $$w_{ij} \in \mathcal{W}$$, $$i$$ is the start node (investing company), $$j$$ is the end node (investee company).    
$$m$$ = |investing companies|    
$$n$$ = |investee companies|      
<br>
$$\mathcal{Q} := \{ (\mathcal{W})_{ij} | (\mathcal{W})_{ij} > 0, i = 1,\ldots , m , j = 1,\ldots ,n \}$$ is a set.    
$$\mathcal{O} : \mathcal{Q} \times \mathbb{R} \rightarrow \mathbb{R}$$ is a function, $$\mathcal{O}(\mathcal{Q}, i )$$ is the ith lowest element of $$\mathcal{Q}$$.    
<br>
$$T: M_{m \times n}(\mathbb{R}) \times \mathbb{R} \rightarrow M_{m \times n}(\mathbb{R})$$ is a function,     
$$T( A , c ) = \{ (A)_{ij} | (A)_{ij} = \begin{cases} (A)_{ij},&\text{if}\ (A)_{ij} > c \\0, & \text{otherwise} \end{cases} \}$$      
<br>
$$B: M_{m \times n}(\mathbb{R}) \times \mathbb{R} \rightarrow M_{m \times n}(\mathbb{R})$$ is a function,     
$$B( A , c ) = \{ (A)_{ij} | (A)_{ij} = \begin{cases} 1,&\text{if}\ (A)_{ij} > c \\0, & \text{otherwise} \end{cases} \}$$       
where $$A \in M_{m \times n}(\mathbb{R})$$.
<br>
Original graph is $$G = (V,E)$$,    
Conditional graph $$G|_{\text{Samsung Electronics}}$$ means, Graph used only nodes that have a path to Samsung Electronics.    

---
## Visualization Method Design 
[1] Representation of each node's Centrality (=$$C(*)$$)    
[2] Representation of core nodes based on Centrality (=$$C_{core}$$)    
[3] Relationship representation between core nodes : Presence or absence of a path (= R)    
[4] Representation of the conditional graph for each core node    
[5] Limitation of nodes used for readability in conditional graph representation (= D)    

According to these rules, $$G \rightarrow G^* := (V,E,C,R,D)$$.    

---
## Methodology : version02
- To create G*, define $$C,R,D$$(+ $$C_{core}$$) according to the purpose.    
- In version 02, $$C,R,D$$(+ $$C_{core}$$) are defined as follows.    

### Def : Centrality

- (1) The number of existing ownership relationships (= $$dc$$)
- (2) The number of being a bridge in ownership relationships ($$cbc$$)
- (3) The number of companies holding ownership (= $$dc_{in}$$)
Average of,
$$C(v) = w_{dc}*dc(v) + w_{cbc}*cdc(v) + w_{dc_{in}}*dc_{in}(v) \: ,v \in V$$    
Representation is $$C(v) = node \, size$$.    

### Def : Relation
If there is an edge (ownership presence) between core nodes $$\rightarrow$$, if not $$\cdots >$$.    

### Def : Depth
Higher path (=$$P_h$$) is defined as follows.    
$$P_h := \{ path(x,y) | x,y \in V , path(x,y) \text{ is not subpath for any path} \}$$    

Depth is defined as follows.
$$D(x,y) = D_x(y)= |path(x,y) \in P_h|$$     
End node y is only included in higher path, distance on the higher path.     

---
## Detail : version02

### [1] $$dc,cbc,dc_{in}$$ 
*If you use the existing definition as it is, the ownership rate information is not reflected, so use it modified.*

- $$dc$$ : degree centrality.    
- $$cbc$$ : communicability betweenness centrality.    
- $$dc_{in}$$ : in degree centrality.    

$$dc,cbc,dc_{in} : M_{m \times n}(\mathbb{R}) \times \mathbb{R} \rightarrow \mathbb{R}$$, are functions.    
<br>

$$dc_t , cbc_t , dc_{int}$$ are modified scores, defined by
$$dc_t(v) = \frac{1}{|\mathcal{Q}|} \sum_{i = 1}^{\mathcal{|Q|}} dc(v|B(\mathcal{W}, \mathcal{O}(\mathcal{Q},i))$$    
$$cbc_t(v) = \frac{1}{|\mathcal{Q}|} \sum_{i = 1}^{\mathcal{|Q|}} cbc(v|B(\mathcal{W},\mathcal{O}(\mathcal{Q},i))$$    
$$dc_{int}(v) = \frac{1}{|\mathcal{Q}|} \sum_{i = 1}^{\mathcal{|Q|}} dc_{in}(v|T(\mathcal{W},\mathcal{O}(\mathcal{Q},i))$$    
<br>
Centrality score of $$v$$ is     
$$C(v) = dc_t(v) + cbc_t(v) + dc_{int}(v)$$   

### [2] $$C_{core}$$ 
Using IQR for outlier detection (count = 3).
$$C_{core} = \{C(v) | C(v) \geq Q_3 + IQR \}$$    
<br>
Using Histogram (based on $C(v) > 1$, count = 4).
$$C_{core} = \{C(v) | C(v) > 1 \}$$    
<br>
Representation example is based on count=3.    

---
## Referance
[1] Huang S, Lv T, Zhang X, Yang Y, Zheng W, Wen C (2014) Identifying Node Role in Social Network Based on Multiple Indicators. PLoS ONE 9(8): e103733. [https://doi.org/10.1371/journal.pone.0103733](https://doi.org/10.1371/journal.pone.0103733)

[2] Qiao, T.; Shan, W.; Yu, G.; Liu, C. A Novel Entropy-Based Centrality Approach for Identifying Vital Nodes in Weighted Networks. Entropy 2018, 20, 261.

[3] Ernesto Estrada, Desmond J. Higham, Naomichi Hatano, “Communicability Betweenness in Complex Networks” Physica A 388 (2009) 764-774. [http://arxiv.org/abs/0905.4102](http://arxiv.org/abs/0905.4102)

[4] Zhang, J.-X. et al. (2016). Identifying a set of influential spreaders in complex networks. Sci. Rep. 6, 27823; doi: 10.1038/srep27823.

[5] Z. A. Rachman, W. Maharani and Adiwijaya, "The analysis and implementation of degree centrality in weighted graph in Social Network Analysis," 2013 International Conference of Information and Communication Technology (ICoICT), Bandung, 2013, pp. 72-76, doi: 10.1109/ICoICT.2013.6574552.


<br>
<br>

## 2. Model improvement for hexbin-based visualization

---

## Methodology & Detail
### [1] Calculate Centrality 
- degree centrality
- communicability betweeness centraility. 
- in degree centraility. 
- eigenvector centrality
- local reaching centrality
- closeness centrality

### [2] Feature Extract : Include indirect ownership in centrality
In this example, the most common importance is calculated.

1. To what extent does the ownership rate exert influence?
-> The value varies depending on the situation, so assumptions are made for all situations.

In the case of Samsung, there were a total of 45 cases of shareholding rates, and each value is used as a Threshold. Thresholds below the holding rate are assumed to have no impact.
-> A total of 45 graphs are generated.

2. Calculate the 6 types of Centrality[1] for each graph.

3. Calculate the influence of indirect ownership
  
$$\text{Impact of indirect ownership} = \gamma^n * \text{Impact of end node}$$
$$\text{ where } \gamma \text{ is discount factor} , n\text{ is depth of end node}$$

4. Calculate the impact of each node (company)

$$Impact_{company} = \text{impact of company node} +  \text{impact of indirect ownership}$$


### [3] Projection 
- Build map, \( H : \mathbb{R}^{33} \rightarrow \mathbb{R}^{2} \)
- In this case, use TSNE algorithm
**TSNE**
$$p_{ij} = \frac{exp(- \vert x_i - x_j \vert^2 / 2 \sigma^2)}{\sum_{k \neq l} exp(- \vert x_k - x_l \vert^2 / 2 \sigma^2)}$$

$$q_{ij} = \frac{ \left( 1 + \vert y_i - y_j \vert^2 \right)^{-1} }{\sum_{k \neq l} \left( 1 + \vert y_k - y_l \vert^2 \right)^{-1} }$$

where $p_{ij}$ is high demensional space , and $q_{ij}$ is low demensional space. map of TSNE $h^*$ satisfies
$$\argmin_{h^* \in H} |h^*(p_{ij}) - q_{ij}|$$

### [4] Binning Sample
- binning each sample in 36 bin size

### [5] Create Density Heatmap with hex space 
<br>
**Hexbin visualization**
</p>
<p align="center">
    <img width="800" src="/assets/2020/shareholding/HexPlot_Multi.png">
</p>

---
## Design & Analysis
### Design
- Companies with high similarity in terms of various importances are placed close together. 
- Overall importance is proportional to darkness and occupied area. 
- Overall importance is indicated next to the company name with a star.
- Circular investments are indicated with an arrow.

*Components*
- distance of each node : similarity 
- number of name : centrality
- arrow : investment
