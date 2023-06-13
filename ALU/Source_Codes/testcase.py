for k in ['Add','Sub',"Mul","Div"]:
    for i in range(2):
        for j in range(4):
            if k == "Add":
                op="+"
            if k == "Div":
                op="/"
            if k == "Mul":
                op="*"            
            if k == "Sub":
                op="-"
            print("Op={};".format(k))
            print("A={};".format(i))
            print("B={};".format(j))
            print("#1")
            print('''
            if (C==A{}B) begin
                result = 0;
            end
            else begin
                result=1;
            end
            '''.format(op))
            print("#1")