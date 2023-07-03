

import UIKit

class LoginController: UIViewController {
    var listaUsers : [User1] = []
    var color = UIColor.red.cgColor
        var color2 = UIColor.white.cgColor
 
    
    
    
    /* elementos*/
     private let ImageView: UIImageView = {
         let imageViewLogin = UIImageView()
         imageViewLogin.contentMode = .scaleAspectFit
         imageViewLogin.image = UIImage(named: "pokeballmini")
         imageViewLogin.translatesAutoresizingMaskIntoConstraints = false
         imageViewLogin.backgroundColor = UIColor(named: "fondogris")
         imageViewLogin.layer.cornerRadius = 15
         imageViewLogin.layer.masksToBounds = true
         return imageViewLogin
     }()
    private let ImageViewPokemon: UIImageView = {
        let imageViewMrRobot = UIImageView()
        imageViewMrRobot.contentMode = .scaleToFill
        imageViewMrRobot.image = UIImage(named: "pokemon")
        imageViewMrRobot.translatesAutoresizingMaskIntoConstraints = false
     
        imageViewMrRobot.layer.cornerRadius = 15
        imageViewMrRobot.layer.masksToBounds = true
        return imageViewMrRobot
    }()

     private lazy var txtUserName: UITextField! = {
        //let txtUser = UITextField ()
         let txtUser =  UITextField(frame: CGRect(x: 63, y: 400, width: 265, height: 50))
         txtUser.layer.cornerRadius = 5
         txtUser.layer.masksToBounds = true
         txtUser.placeholder = "UserName"
         txtUser.font = UIFont.systemFont(ofSize: 15)
         txtUser.borderStyle = UITextField.BorderStyle.roundedRect
         txtUser.backgroundColor = UIColor.white
         txtUser.textColor = UIColor(named: "grisbotonlogin")
         //txtUser.text = "prueba"
        
        return txtUser
    }()
    private lazy var txtPassword: UITextField! = {
       //let txtUser = UITextField ()
        let txtPass =  UITextField(frame: CGRect(x: 63, y: 470, width: 265, height: 50))
        txtPass.layer.cornerRadius = 5
        txtPass.layer.masksToBounds = true
        txtPass.placeholder = "Password"
        txtPass.font = UIFont.systemFont(ofSize: 15)
        txtPass.borderStyle = UITextField.BorderStyle.roundedRect
        txtPass.backgroundColor = UIColor.white
        txtPass.textColor = UIColor(named: "grisbotonlogin")
        //txtUser.text = "prueba"
       
       return txtPass
   }()
    private lazy var btnLogin : UIButton = {
        var config = UIButton.Configuration.borderedProminent()
        config.title = "Log In"
        let btnLogin = UIButton(type: .system)
        btnLogin.addTarget(self, action: #selector(btnLoginAction), for: .touchUpInside)
        btnLogin.configuration = config
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        btnLogin.setTitleColor(UIColor.white, for: .normal)
        btnLogin.layer.cornerRadius = 0
        btnLogin.layer.masksToBounds = true
        btnLogin.tintColor = UIColor(named: "grisbotonlogin")
           return btnLogin
       }()
    private let lblValidacion : UILabel = {
          let lblValidacionLogin = UILabel()
        lblValidacionLogin.numberOfLines = 0
        lblValidacionLogin.textAlignment = .center
        lblValidacionLogin.text = "test"
        lblValidacionLogin.textColor = UIColor(named: "validacion")
        lblValidacionLogin.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        lblValidacionLogin.translatesAutoresizingMaskIntoConstraints = false
       // lblValidacionLogin.backgroundColor = UIColor(named: "fondogris")
        lblValidacionLogin.layer.cornerRadius = 15
        lblValidacionLogin.layer.masksToBounds = true
          return lblValidacionLogin
      }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //degradado()
        setGradientBackground()
   

        
        [ImageView,txtUserName,btnLogin,txtPassword,lblValidacion,ImageViewPokemon].forEach(view.addSubview)
        view.bringSubviewToFront(ImageView)
       
        /* contraints*/
        NSLayoutConstraint.activate([
        
            /*/ imagen MovieDB*/
            ImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 230),
            ImageView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -440),
            ImageView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -50),
            ImageView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 50),
            /* lblvalidacion*/
            lblValidacion.topAnchor.constraint(equalTo: btnLogin.bottomAnchor, constant: 20),
            lblValidacion.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -180),
            lblValidacion.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            lblValidacion.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            /* boton login */
            btnLogin.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 20),
            btnLogin.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -230),
            btnLogin.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -50),
            btnLogin.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 47),
//            /* imagen MrRobot*/
//            ImageViewMrRobot.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: -80),
//            ImageViewMrRobot.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -470),
//            ImageViewMrRobot.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -180),
//            ImageViewMrRobot.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
            /* imagen MrRobot*/
            ImageViewPokemon.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            ImageViewPokemon.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -600),
            ImageViewPokemon.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -30),
            ImageViewPokemon.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 30),
      
        
//
        ])
    
       

    }
    
    @objc func btnLoginAction() {
        guard txtUserName.text != "" else{
            lblValidacion.text = "Campo Requerido"
            lblValidacion.textColor  = .red
            txtUserName.layer.borderColor = color
            txtUserName.layer.borderWidth = 1.0
                        return
                    }
        lblValidacion.text = ""
        txtUserName.layer.borderColor = color2
        txtUserName.layer.borderWidth = 1.0
               
             guard txtPassword.text != "" else{
                 lblValidacion.text = "Campo Requerido"
                 lblValidacion.textColor  = .red
                 txtPassword.layer.borderColor = color
                 txtPassword.layer.borderWidth = 1.0
                 return
                    }
        lblValidacion.text = ""
                 
        txtPassword.layer.borderColor = color2
        txtPassword.layer.borderWidth = 1.0
        
        var result = LoginViewModel.GetByUsername(txtUserName.text!)
        if result.Correct == true {
            print("existe el usuario")
            for obj in result.Objects!{
                           let user = obj as! User1  //Unboxing
                     
                            listaUsers.append(user)
                       }
            print(listaUsers)
            
            guard txtPassword.text == listaUsers[0].password else {
                let alert = UIAlertController(title: "Mensaje", message: "Contraseña incorrecta", preferredStyle: .alert)
                              let action = UIAlertAction(title: "Aceptar", style: .default)
                              alert.addAction(action)
                              
                                  self.present(alert, animated: true)
                
              //  lblValidacion.text = "Contraseña incorrecta"
               // lblValidacion.textColor  = .red
                
                return
            }
            lblValidacion.text = ""
            self.performSegue(withIdentifier: "LoginGetSegue", sender: self)
            
            
            
        }else {
            let alert = UIAlertController(title: "Mensaje", message: "Ocurrio un error al ingresar, el nombre de usuario no existe.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Aceptar", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true)
            print("no existe el usuario")
        }
        
//        var result = LoginViewModel.GetAll()
//        if result.Correct!{
//                for objCarrito in result.Objects!{
//                    let users = objCarrito as! User1 //Unboxing
//
//                    listaUsers.append(users)
//                }
//            print(listaUsers)
//
//            }
        
        
        
     
//        var result = LoginViewModel.Add(self.txtUserName.text!, self.txtPassword.text!)
//        if result.Correct == true {
//            print("se agrego correctamente")
//        }else {
//            print("ocurrio un error al agregar")
//        }
        
//        var result = LoginViewModel.GetByUsername(txtUserName.text!)
//        if result.Correct == true {
//
//
//        } else {
//            print("no existe")
//        }
//


        
    }
  
    func setGradientBackground() {
        
        let colorTop =  UIColor(named: "fondodegradado")!.cgColor
        let colorBottom = UIColor(named: "fondogris")!.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]

        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.frame = self.view.bounds
     
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
 
}
