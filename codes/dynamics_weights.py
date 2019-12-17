import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

# Initializing the network
# n = number of nodes, m = number of connections from a new node to an existing one
n = 40
m = 5
# preferential attachement
G = nx.barabasi_albert_graph(n,m)
# complete graph
#G = nx.complete_graph(n)
# paths
#G = nx.path_graph(n)

# code for drawing the graph and creating the adjacency matrix
#initpos = nx.spring_layout(G)

#nx.draw_networkx(G)
#A = nx.adjacency_matrix(G)
#plt.show()
#plt.savefig('inicial_weights.pdf')

#######################################

# function value_desvio (nodo, grafo, subgrafo de coordinados actuales, iteraciones, opiniones actuales,eta, delta)
# calcula el valor (y toda la dinamica por T iteraciones) de el desvio actaulizando la dinamica escuchando a mis vecinos no coordinados

# function value_remain (nodo, grafo, subgrafo de coordinados actuales, iteraciones, opiniones actuales,eta, delta)
# calcula el valor (y toda la dinamica por T iteraciones) de no desviarse, y actualizando la dinamica siguiendo la opinion posted

######################################

# Initial opinions randomly
s = np.random.rand(n,1)
eta = 0.3

# Coordinates nodes: declared as a vector
C = [0,1,2]

# Subgraph induced by the coordinated nodes
G_C = G.subgraph(C)

# opinion dynamics with degree-weighted importance
alfa = s.copy()

# iterations
it = 25

# possible posted opinion policies
# static 
posted = 0.4
# mean static
posted = mean(s[i] for i in C)

# Dynamics
for t in range(it):
    for i in range(n):
        if i in C:
            if value_remain((n,G,alpha,eta,C,it,i,posted,t)<value_desvio(input):
                gamma[i] = degroot(i)
                print(i)        
                print("desvio")
            else
                gamma[i] = posted

###############################3
# update according to DeGroot
for t in range(it):
    # update the dynamics
    if i in C:
        gamma[i] = posted
    for i in range(n):
        if G.degree(i) > 0:
            aux = alfa
            alfa[i] = (1-eta)*aux[i]+eta*sum(aux[v] for v in G[i]))/G.degree(i)
            aux2 = gamma
            gamma[i] = (1-eta)*aux2[i]+eta*sum(aux2[v] for v in G[i]))/G.degree(i)
##################################                


            
# code for drawing the graph and creating the adjacency matrix
# finalpos = nx.spring_layout(G)
# nx.draw_networkx(G, finalpos)
print(z)
nx.draw_networkx(G)
plt.show()
plt.savefig('final_weights.pdf')
nx.write_gexf(G,"test.gexf")
