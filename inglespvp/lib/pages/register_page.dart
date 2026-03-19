import 'package:flutter/material.dart';
import 'package:inglespvp/widgets/decoracion_titulo.dart';
import 'package:inglespvp/widgets/input_decorado.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String categoria = '';
  final formKey = GlobalKey<FormState>();
  final TextEditingController fechaController = TextEditingController();
  String nombre = '';
  String apellidos = '';
  String gamertag = '';
  String telefono = '';
  DateTime fechaSeleccionada = DateTime.now();
  final List<String> categorias = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];

  seleccionarFecha(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
        context: context, 
        firstDate: DateTime(1950), 
        lastDate: DateTime(2030),
        initialDate: fechaSeleccionada,

        //personalización
        builder: (context, child){
          return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange, // Color de LingoMatch
              onPrimary: Colors.white,
              surface: Color(0xFFFDFCF4),
            ),
          ),
            child: child!
          );
        }
      );
      if (picked != null){
        setState(() {
          fechaSeleccionada = picked;
          fechaController.text = '${picked.day}/${picked.month}/${picked.year}';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 150,
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                
                Text(
                  '¡TERMINA TU CUENTA!',
                  style: TextStyle(
                    fontSize: 24, 
                    color: Color(0xFF1D3557),
                  ),
                ),
                Text(
                  'PARA UNA EXPERIENCIA UNICA', 
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
            
                decoracion_titulo(titulo: 'INFORMACIÓN BASICA'),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(label: 'Nombre', hint: 'Ingresa tu nombre', borderColor: Colors.cyan,
                        onSaved: (value) => nombre = value!,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Escribe tu nombre';
                          return null;
                        },
                      ) 
                    
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CustomTextField(label: 'Apellidos', hint: 'Ingresa tu apellido', borderColor: Colors.orangeAccent,
                        onSaved: (value) => apellidos = value!,  
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Escribe tu apellido';
                          return null;
                        },
                      ))
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'Nacimiento',
                        hint: 'DD/MM/YYYY',
                        borderColor: Colors.orangeAccent,
                        controller: fechaController,
                        readOnly: true, // No teclado
                        onTap: () => seleccionarFecha(context),
                        icon: Icons.calendar_today_rounded,
                        validator: (value) => value!.isEmpty ? 'Falta fecha' : null,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nivel de ingles', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),),
                          SizedBox(height: 5),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.cyan, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.cyan, width: 2.5),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 105, 105, 105)),
                            style: const TextStyle(color: Colors.black, fontSize: 14),
                            initialValue: categorias[0],
                            items: categorias.map((String cat){
                              return DropdownMenuItem(
                                value: cat,
                                child: Text(cat),
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                categoria = value!;
                              });
                              
                            },                      
                          )
                        ],
                      )
                    ),
                  ],
                ),
            
                const SizedBox(height: 35),
            
                decoracion_titulo(titulo: 'PERSONALIZATE'),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ELIGE TU AVATAR', 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                SizedBox(height: 10),
                _buildAvatarSelector(),
                
                SizedBox(height: 20),
                CustomTextField(
                  label: 'GAMERTAG',
                  hint: 'SamuelDelucke',
                  borderColor: Colors.cyan,
                  onSaved: (value) => gamertag = value!,
                  validator: (value) {
                    if (value!.isEmpty) return 'Elige un gamertag';
                    return null;
                  },
                ),

                SizedBox(height: 15),
                CustomTextField(
                  label: 'TELÉFONO',
                  hint: '442 123 4567',
                  borderColor: Colors.orangeAccent,
                  icon: Icons.phone_android_rounded,
                  keyboardType: TextInputType.phone, // <--- Esto activará el teclado numérico
                  onSaved: (value) => telefono = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Requerido';
                    if (value.length < 10 || value.length > 10) return '10 dígitos';
                    return null;
                  },
                ),
                SizedBox(height: 40),
            
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Guardado con exito'))
                        );
                        Navigator.pushNamed(context, 'pantalla_principal');
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error al guardar'))
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Comenzar Aventura!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 18, 
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ya eres un miembro? Login ->', 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }


//jaja esto lo hizo gpt y no jala
  Widget _buildAvatarSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) => Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFFEF9E7),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: index == 0 ? Colors.orange : Colors.grey.withOpacity(0.3), 
            width: 2.5,
          ),
        ),
        child: const Icon(Icons.person, color: Colors.orange, size: 30),
      )),
    );
  }
}