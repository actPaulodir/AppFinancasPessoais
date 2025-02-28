import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/aviso_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login_cadastro_model.dart';
export 'login_cadastro_model.dart';

// Classe modelo para gerenciar o estado
class AppModel extends ChangeNotifier {
  // Controladores dos campos de texto
  final TextEditingController nomeCreateTextController = TextEditingController();
  final TextEditingController emailAddressCreateTextController = TextEditingController();

  // Variável para armazenar o resultado da ação
  dynamic actionCreateUser;

  // Método para limpar os controladores
  void disposeControllers() {
    nomeCreateTextController.dispose();
    emailAddressCreateTextController.dispose();
  }
}

// Classe simulada para operações de banco de dados
class UsuariosTable {
  Future<dynamic> insert(Map<String, dynamic> data) async {
    // Simula uma operação de banco de dados assíncrona
    await Future.delayed(const Duration(seconds: 1));

    // Retorna um ID fictício para exemplo
    return {'status': 'success', 'user_id': '123'};
  }
}

class LoginCadastroWidget extends StatefulWidget {
  const LoginCadastroWidget({super.key});

  @override
  State<LoginCadastroWidget> createState() => _LoginCadastroWidgetState();
}

class _LoginCadastroWidgetState extends State<LoginCadastroWidget> {
  final AppModel _model = AppModel();
  final UsuariosTable _usuariosTable = UsuariosTable();
  final String currentUserUid = 'user_123'; // ID fictício do usuário atual

  @override
  void dispose() {
    _model.disposeControllers();
    super.dispose();
  }

  Future<void> _createUser() async {
    try {
      _model.actionCreateUser = await _usuariosTable.insert({
        'user_id': currentUserUid,
        'nome': _model.nomeCreateTextController.text,
        'email': _model.emailAddressCreateTextController.text,
      });

      // Mostrar feedback de sucesso
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário criado com sucesso!')),
        );
      }
    } catch (e) {
      // Mostrar feedback de erro
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar usuário: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Novo Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _model.nomeCreateTextController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _model.emailAddressCreateTextController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _createUser,
              child: const Text('Criar Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}