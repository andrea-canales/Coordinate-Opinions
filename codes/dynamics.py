import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

# Initializing the network
# n = number of nodes, m = number of connections from a new node to an existing one
n = 20
m = 2
# preferential attachement
G = nx.barabasi_albert_graph(n,m)
# complete graph
#G = nx.complete_graph(n)
# paths
#G = nx.path_graph(n)

# code for drawing the graph and creating the adjacency matrix
#initpos = nx.spring_layout(G)
nx.draw_networkx(G)
#A = nx.adjacency_matrix(G)
plt.show()
plt.savefig('inicial.pdf')

# initializing the innate opinions and susceptibility, randomly
s = np.random.rand(n,1)
alfa = np.random.rand(n,1)

# opinion dynamics with susceptibilities
z = s.copy()
# tolerance threshold
umbral = 0.25

# iteraciones
it = 25
print(s)
print(alfa)
for t in range(it):
#    print(z[0])
    # update the dynamics
    for i in range(n):
#        print(i)
        if G.degree(i) > 0:
            aux = z
            z[i] = alfa[i]*aux[i]+(1-alfa[i])*sum(aux[v] for v in G[i])/G.degree(i)
        # here we test polarization
#        vecinos = G.edges(i)
#        print(vecinos)
        for w in G.copy().edges(i):
#            print(w)
            if np.absolute(z[i]-z[w[1]]) > umbral:
               G.remove_edge(i,w[1])
               print("te odio")

# code for drawing the graph and creating the adjacency matrix
#finalpos = nx.spring_layout(G)
#nx.draw_networkx(G, finalpos)
print(z)
nx.draw_networkx(G)
plt.show()
plt.savefig('final.pdf')
