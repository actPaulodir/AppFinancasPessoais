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
import 'auth1_model.dart';
export 'auth1_model.dart';

//class LoginCadastroWidget extends StatefulWidget {
class LoginCadastroWidget extends StatefulWidget {
  const LoginCadastroWidget({super.key});

  static String routeName = 'LoginCadastro';
  static String routePath = '/loginCadastro';

  @override
  State<LoginCadastroWidget> createState() => _LoginCadastroWidgetState();
}

class _LoginCadastroWidgetState extends State<LoginCadastroWidget>
    with TickerProviderStateMixin {
  late LoginCadastroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCadastroModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}));
    _model.nomeCreateTextController ??= TextEditingController();
    _model.nomeCreateFocusNode ??= FocusNode();

    _model.emailAddressCreateTextController ??= TextEditingController();
    _model.emailAddressCreateFocusNode ??= FocusNode();

    _model.passwordCreateTextController ??= TextEditingController();
    _model.passwordCreateFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () =>
        [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () =>
        [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () =>
        [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 32),
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme
                        .of(context)
                        .primaryBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Theme
                          .of(context)
                          .brightness == Brightness.dark
                          ? 'assets/images/logo_branco.png'
                          : 'assets/images/logo_azul.png',
                      width: 300,
                      height: 255,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery
                              .sizeOf(context)
                              .width >= 768.0
                              ? 530.0
                              : 630.0,
                          constraints: BoxConstraints(
                            maxWidth: 570,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme
                                .of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: FlutterFlowTheme
                                  .of(context)
                                  .primaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme
                                        .of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                    FlutterFlowTheme
                                        .of(context)
                                        .secondaryText,
                                    labelPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        32, 0, 32, 0),
                                    labelStyle: FlutterFlowTheme
                                        .of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                    unselectedLabelStyle:
                                    FlutterFlowTheme
                                        .of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                    indicatorColor:
                                    FlutterFlowTheme
                                        .of(context)
                                        .success,
                                    indicatorWeight: 3,
                                    tabs: [
                                      Tab(
                                        text: 'Criar Conta',
                                      ),
                                      Tab(
                                        text: 'Log In',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24, 16, 24, 0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                Text(
                                                  'Criar Conta',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .headlineMedium
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 24),
                                                  child: Text(
                                                    'Crie sua nova conta',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily:
                                                      'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 16),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .nomeCreateTextController,
                                                      focusNode: _model
                                                          .nomeCreateFocusNode,
                                                      autofocus: true,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: 'Nome',
                                                        labelStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsets.all(24),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      validator: _model
                                                          .nomeCreateTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 16),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailAddressCreateTextController,
                                                      focusNode: _model
                                                          .emailAddressCreateFocusNode,
                                                      autofocus: true,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: 'Email',
                                                        labelStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsets.all(24),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      validator: _model
                                                          .emailAddressCreateTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 16),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordCreateTextController,
                                                      focusNode: _model
                                                          .passwordCreateFocusNode,
                                                      autofocus: true,
                                                      autofillHints: [
                                                        AutofillHints.password
                                                      ],
                                                      obscureText: !_model
                                                          .passwordCreateVisibility,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: 'Password',
                                                        labelStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsets.all(24),
                                                        suffixIcon: InkWell(
                                                          onTap: () =>
                                                              safeSetState(
                                                                    () =>
                                                                _model
                                                                    .passwordCreateVisibility =
                                                                !_model
                                                                    .passwordCreateVisibility,
                                                              ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                              true),
                                                          child: Icon(
                                                            _model
                                                                .passwordCreateVisibility
                                                                ? Icons
                                                                .visibility_outlined
                                                                : Icons
                                                                .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      validator: _model
                                                          .passwordCreateTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 0, 16),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                        false;
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();

                                                        final user =
                                                        await authManager
                                                            .createAccountWithEmail(
                                                          context,
                                                          _model
                                                              .emailAddressCreateTextController
                                                              .text,
                                                          _model
                                                              .passwordCreateTextController
                                                              .text,
                                                        );
                                                        if (user == null) {
                                                          return;
                                                        }

                                                        _model
                                                            .actionCreateUser =
                                                        await UsuariosTable()
                                                            .insert({
                                                          'user_id':
                                                          currentUserUid,
                                                          'nome': _model
                                                              .nomeCreateTextController
                                                              .text,
                                                          'email': _model
                                                              .emailAddressCreateTextController
                                                              .text,
                                                        });
                                                        _shouldSetState = true;
                                                        if (_model
                                                            .actionCreateUser
                                                            ?.userId ==
                                                            'active') {
                                                          context.pushNamedAuth(
                                                              HomePageWidget
                                                                  .routeName,
                                                              context.mounted);

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                            true,
                                                            backgroundColor:
                                                            Color(
                                                                0x78000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                      context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                      context),
                                                                  child:
                                                                  AvisoPagamentoWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                      () {}));

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                      text: 'Criar Conta',
                                                      options: FFButtonOptions(
                                                        width: 230,
                                                        height: 52,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .success,
                                                        textStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .titleSmall
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          color: Colors
                                                              .white,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(40),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation1']!),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24, 16, 24, 0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                Text(
                                                  'Bem vindo de volta',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .headlineMedium
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 24),
                                                  child: Text(
                                                    'Acesse sua conta',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily:
                                                      'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 16),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailAddressTextController,
                                                      focusNode: _model
                                                          .emailAddressFocusNode,
                                                      autofocus: true,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: 'Email',
                                                        labelStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primaryBackground,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24,
                                                            24, 0, 24),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      validator: _model
                                                          .emailAddressTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 16),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordTextController,
                                                      focusNode: _model
                                                          .passwordFocusNode,
                                                      autofocus: true,
                                                      autofillHints: [
                                                        AutofillHints.password
                                                      ],
                                                      obscureText: !_model
                                                          .passwordVisibility,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: 'Password',
                                                        labelStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(40),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24,
                                                            24, 0, 24),
                                                        suffixIcon: InkWell(
                                                          onTap: () =>
                                                              safeSetState(
                                                                    () =>
                                                                _model
                                                                    .passwordVisibility =
                                                                !_model
                                                                    .passwordVisibility,
                                                              ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                              true),
                                                          child: Icon(
                                                            _model
                                                                .passwordVisibility
                                                                ? Icons
                                                                .visibility_outlined
                                                                : Icons
                                                                .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      validator: _model
                                                          .passwordTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 0, 16),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();

                                                        final user =
                                                        await authManager
                                                            .signInWithEmail(
                                                          context,
                                                          _model
                                                              .emailAddressTextController
                                                              .text,
                                                          _model
                                                              .passwordTextController
                                                              .text,
                                                        );
                                                        if (user == null) {
                                                          return;
                                                        }

                                                        context.goNamedAuth(
                                                            HomePageWidget
                                                                .routeName,
                                                            context.mounted);
                                                      },
                                                      text: 'Entrar',
                                                      options: FFButtonOptions(
                                                        width: 230,
                                                        height: 52,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .success,
                                                        textStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .titleSmall
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          color: Colors
                                                              .white,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(40),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation2']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}}