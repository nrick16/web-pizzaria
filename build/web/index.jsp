<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="CSS/estilo.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    <head>
        <title>Pizzaria do Zé</title>
        <!--Made with love by Mutiullah Samim -->

        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="styles.css">
        <!--link href="css/estilo.css" rel="stylesheet"-->
    </head>
    <%
      Connection con = null; 
      Statement st = null;
      ResultSet rs = null;
    %>
    <body>

        <div class="container">
            <img src="https://images.vexels.com/media/users/3/136312/isolated/preview/213fb725b5fbbd669093a338c9c16bdd-logo-pizza-fast-food.png" alt="logotipo" id="imglogo"/>

            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <h3>Entrar</h3>
                        <div class="d-flex justify-content-end social_icon">
                            <span><i class="fab fa-facebook-square"></i></span>
                            <span><i class="fab fa-google-plus-square"></i></span>
                            <span><i class="fab fa-twitter-square"></i></span>
                        </div>
                    </div>
                    <div class="card-body">
                        <form id="login-form" class="form" action="index.jsp" method="post">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" id="txtusuario" name="txtusuario" class="form-control" placeholder="Usuário" required>

                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" id="txtsenha" name="txtsenha" class="form-control" placeholder="Senha" required>
                            </div>
                            <div class="row align-items-center remember">
                                <input type="checkbox">Lembrar de mim
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Login" class="btn float-right login_btn">
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Não tem uma conta?<a href="#">Cadastrar</a>
                        </div>
                        <div class="d-flex justify-content-center">
                            <a href="#">Esqueceu a senha?</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                String usuario = request.getParameter("txtusuario");
                String senha = request.getParameter("txtsenha");
                String nomeUsuario = "";
                
                String user = "", pass = "";
                int i = 0;
                /*try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/pizzariadoze?useTimezone=true&serverTimezone=UTC&user=root&password=");
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM usuarios");
                while(rs.next()){
                    out.prinln(rs.getString(2));
                }
                }catch(Exception e){
                    out.print(e);
                } */
                
                try{
                
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("SELECT * FROM usuarios where usuario = '"+usuario+"' and senha = '"+senha+"'");
                while(rs.next()){
                    user = rs.getString(3); 
                    pass = rs.getString(4); 
                    nomeUsuario = rs.getString(2);
                    rs.last();
                    i = rs.getRow(); 
                }
                }catch(Exception e){
                   out.print(e);
                }
                
                if(usuario == null || senha == null){
                    out.println("Dados inválidos");
                }else{
                    if(i > 0) {
                        session.setAttribute("nomeUsuario", nomeUsuario);
                        response.sendRedirect("usuarios.jsp");
                    }else{
                        out.println("Dados Incorretos"); 
                    }
                }
                
            %>
        </div>
    </body>
</html>