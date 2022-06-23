import numpy as np

maze = [[1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
        [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
        [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
        [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
        [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
        [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1]]

dict={
(7, 1):101,      (6, 2):102,      (5, 3):103,      (4, 4):104,      (3, 5):105,      (2, 6):106,      (1, 7):107,
(8, 2):109,      (7, 3):110,      (6, 4):111,      (5, 5):112,      (4, 6):113,      (3, 7):114,      (2, 8):115,
(9, 3):117,      (8, 4):118,      (7, 5):119,      (6, 6):120,      (5, 7):121,      (4, 8):122,      (3, 9):123,
(10, 4):125,     (9, 5):126,      (8, 6):127,      (7, 7):128,      (6, 8):129,      (5, 9):130,      (4, 10):131,
(11, 5):133,     (10, 6):134,     (9, 7):135,      (8, 8):136,      (7, 9):137,      (6, 10):138,     (5, 11):139,
(12, 6):141,     (11, 7):142,     (10, 8):143,     (9, 9):144,      (8, 10):145,     (7, 11):146,     (6, 12):147,
(13, 7):149,     (12, 8):150,     (11, 9):151,     (10, 10):152,    (9, 11):153,     (8, 12):154,     (7, 13):155,

(7, 0):1,       (6, 1):2,         (5, 2):3,       (4, 3):4,       (3, 4):5,       (2, 5):6,       (1, 6):7,       (0, 7):8,
(8, 1):9,       (7, 2):10,        (6, 3):11,      (5, 4):12,      (4, 5):13,      (3, 6):14,      (2, 7):15,      (1, 8):16,
(9, 2):17,      (8, 3):18,        (7, 4):19,      (6, 5):20,      (5, 6):21,      (4, 7):22,      (3, 8):23,      (2, 9):24,
(10, 3):25,     (9, 4):26,        (8, 5):27,      (7, 6):28,      (6, 7):29,      (5, 8):30,      (4, 9):31,      (3, 10):32,
(11, 4):33,     (10, 5):34,       (9, 6):35,      (8, 7):36,      (7, 8):37,      (6, 9):38,      (5, 10):39,     (4, 11):40,
(12, 5):41,     (11, 6):42,       (10, 7):43,     (9, 8):44,      (8, 9):45,      (7, 10):46,     (6, 11):47,     (5, 12):48,
(13, 6):49,     (12, 7):50,       (11, 8):51,     (10, 9):52,     (9, 10):53,     (8, 11):54,     (7, 12):55,     (6, 13):56,
(14, 7):57,     (13, 8):58,       (12, 9):59,     (11, 10):60,    (10, 11):61,    (9, 12):62,     (8, 13):63,     (7, 14):64
}
key_list = list(dict.keys())
val_list = list(dict.values())

class Node:
    """
        A node class for A* Pathfinding
        parent is parent of the current Node
        position is current position of the Node in the maze
        g is cost from start to current Node
        h is heuristic based estimated cost for current Node to end Node
        f is total cost of present node i.e. :  f = g + h
    """

    def __init__(self, parent=None, position=None):
        self.parent = parent
        self.position = position

        self.g = 0
        self.h = 0
        self.f = 0
    def __eq__(self, other):
        return self.position == other.position

#This function return the path of the search
def return_path(current_node,maze):
    path = []
    no_rows, no_columns = np.shape(maze)
    # here we create the initialized result maze with -1 in every position
    result = [[-1 for i in range(no_columns)] for j in range(no_rows)]
    current = current_node
    while current is not None:
        path.append(current.position)
        current = current.parent
    # Return reversed path as we need to show from start to end path
    path = path[::-1]
    start_value = 0
    # we update the path of start to end found by A-star serch with every step incremented by 1
    for i in range(len(path)):
        result[path[i][0]][path[i][1]] = start_value
        start_value += 1
    return result


def search(maze, cost, start, end):
    """
        Returns a list of tuples as a path from the given start to the given end in the given maze
        :param maze:
        :param cost
        :param start:
        :param end:
        :return:
    """

    # Create start and end node with initized values for g, h and f
    start_node = Node(None, tuple(start))
    start_node.g = start_node.h = start_node.f = 0
    end_node = Node(None, tuple(end))
    end_node.g = end_node.h = end_node.f = 0

    # Initialize both yet_to_visit and visited list
    # in this list we will put all node that are yet_to_visit for exploration. 
    # From here we will find the lowest cost node to expand next
    yet_to_visit_list = []  
    # in this list we will put all node those already explored so that we don't explore it again
    visited_list = [] 
    
    # Add the start node
    yet_to_visit_list.append(start_node)
    
    # Adding a stop condition. This is to avoid any infinite loop and stop 
    # execution after some reasonable number of steps
    outer_iterations = 0
    max_iterations = (len(maze) // 2) ** 10

    # what squares do we search . serarch movement is left-right-top-bottom 
    #(4 movements) from every positon

    move  =  [[-1, 0 ], # go up
              [ 0, -1], # go left
              [ 1, 0 ], # go down
              [ 0, 1 ]] # go right


    """
        1) We first get the current node by comparing all f cost and selecting the lowest cost node for further expansion
        2) Check max iteration reached or not . Set a message and stop execution
        3) Remove the selected node from yet_to_visit list and add this node to visited list
        4) Perofmr Goal test and return the path else perform below steps
        5) For selected node find out all children (use move to find children)
            a) get the current postion for the selected node (this becomes parent node for the children)
            b) check if a valid position exist (boundary will make few nodes invalid)
            c) if any node is a wall then ignore that
            d) add to valid children node list for the selected parent
            
            For all the children node
                a) if child in visited list then ignore it and try next node
                b) calculate child node g, h and f values
                c) if child in yet_to_visit list then ignore it
                d) else move the child to yet_to_visit list
    """
    #find maze has got how many rows and columns 
    no_rows, no_columns = np.shape(maze)
    
    # Loop until you find the end
    
    while len(yet_to_visit_list) > 0:
        
        # Every time any node is referred from yet_to_visit list, counter of limit operation incremented
        outer_iterations += 1    

        
        # Get the current node
        current_node = yet_to_visit_list[0]
        current_index = 0
        for index, item in enumerate(yet_to_visit_list):
            if item.f < current_node.f:
                current_node = item
                current_index = index
                
        # if we hit this point return the path such as it may be no solution or 
        # computation cost is too high
        if outer_iterations > max_iterations:
            print ("giving up on pathfinding too many iterations")
            # path = []
            # current = current_node
            # while current is not None:
            #     path.append(current.position)
            #     current = current.parent
            # return path[::-1] # Return reversed path

        # Pop current node out off yet_to_visit list, add to visited list
        yet_to_visit_list.pop(current_index)
        visited_list.append(current_node)

        # test if goal is reached or not, if yes then return the path
        if current_node == end_node:
            path = []
            current = current_node
            while current is not None:
                path.append(current.position)
                current = current.parent
            return path[::-1] # Return reversed path

        # Generate children from all adjacent squares
        children = []

        for new_position in move: 

            # Get node position
            node_position = (current_node.position[0] + new_position[0], current_node.position[1] + new_position[1])

            # Make sure within range (check if within maze boundary)
            if (node_position[0] > (no_rows - 1) or 
                node_position[0] < 0 or 
                node_position[1] > (no_columns -1) or 
                node_position[1] < 0):
                continue

            # Make sure walkable terrain
            if maze[node_position[0]][node_position[1]] != 0:
                continue

            # Create new node
            new_node = Node(current_node, node_position)

            # Append
            children.append(new_node)

        # Loop through children
        for child in children:
            
            # Child is on the visited list (search entire visited list)
            if len([visited_child for visited_child in visited_list if visited_child == child]) > 0:
                continue

            # Create the f, g, and h values
            child.g = current_node.g + cost
            ## Heuristic costs calculated here, this is using eucledian distance
            child.h = (((child.position[0] - end_node.position[0]) ** 2) + 
                       ((child.position[1] - end_node.position[1]) ** 2)) 

            child.f = child.g + child.h

            # Child is already in the yet_to_visit list and g cost is already lower
            if len([i for i in yet_to_visit_list if child == i and child.g > i.g]) > 0:
                continue

            # Add the child to the yet_to_visit list
            yet_to_visit_list.append(child)

def search_green(maze,cost, start_green, end, start_red):
    start1=start_red

    start1=start1-9
    for x in range(3):
        for y in range(3):
            start1_center=start1+y
            try:
                val = val_list.index(start1_center)
                key=key_list[val]
                maze[key[0]][key[1]]=1
            except:
                pass
        start1=start1+8

    if start1 < 100:
        start1=start1+94
    else:
        start1=start1-97

    for x in range(4):
        for y in range(4):
            start1_center=start1-y
            try:
                val = val_list.index(start1_center)
                key=key_list[val]
                maze[key[0]][key[1]]=1
            except:
                pass
        start1=start1-8

    position = val_list.index(start_green)
    start=(key_list[position])

    path=search(maze,cost, start, end)
    print(path)

    if path:
        for x in range(len(path)):
            maze[path[x][0]][path[x][1]] = 3
    print(maze)

if __name__ == '__main__':

    start = (6, 0)
    end = (0, 6)
    cost = 1 # cost per movement

    path = search(maze,cost, start, end)
    print(path)

    start_red = 20
    start_green = 10
    search_green(maze,cost, start_green, end, start_red)

