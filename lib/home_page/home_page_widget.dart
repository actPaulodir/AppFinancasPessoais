import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/adicionar_registro_widget.dart';
import '/components/editar_registro_widget.dart';
import '/components/meu_perfil_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Color(0x80000000),
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: AdicionarRegistroWidget(),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).success,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).info,
          size: 24,
        ),
      ),
      body: FutureBuilder<List<UsuariosRow>>(
        future: UsuariosTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'user_id',
            currentUserUid,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<UsuariosRow> geralUsuariosRowList = snapshot.data!;

          final geralUsuariosRow = geralUsuariosRowList.isNotEmpty
              ? geralUsuariosRowList.first
              : null;

          return Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: 250,
                        height: MediaQuery.sizeOf(context).height,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                              ? 'assets/images/logo_branco.png'
                                              : 'assets/images/logo_azul.png',
                                          width: 300,
                                          height: 77,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.home,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              size: 30,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Text(
                                                'Painel Financeiro',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0x0057636C),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Color(0x7F000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                          MediaQuery.viewInsetsOf(context),
                                          child: MeuPerfilWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            geralUsuariosRow?.fotoPerfil,
                                            'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          'Configuração da Conta',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Icon(
                                          Icons.logout,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: FutureBuilder<List<RegistrosRow>>(
                      future: RegistrosTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'user_id',
                          currentUserUid,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<RegistrosRow> conteudoRegistrosRowList =
                        snapshot.data!;

                        return Container(
                          width: 100,
                          height: MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 24, 8, 8),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 250,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Boas Vindas',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                              Text(
                                                '${geralUsuariosRow?.nome}👋',
                                                style: FlutterFlowTheme.of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  fontSize: 22,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          desktop: false,
                                        ))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                    child: MeuPerfilWidget(),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Icon(
                                              Icons.menu,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                              size: 45,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: FutureBuilder<List<ViewSaldofinalRow>>(
                                    future:
                                    ViewSaldofinalTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'usuario',
                                        currentUserUid,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ViewSaldofinalRow>
                                      totaisViewSaldofinalRowList =
                                      snapshot.data!;

                                      final totaisViewSaldofinalRow =
                                      totaisViewSaldofinalRowList.isNotEmpty
                                          ? totaisViewSaldofinalRowList
                                          .first
                                          : null;

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 4),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                child: Container(
                                                  width: 180,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .height,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .tag_faces_outlined,
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .secondaryText,
                                                              size: 24,
                                                            ),
                                                            Text(
                                                              'Saldo  Final',
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                0.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              totaisViewSaldofinalRow
                                                                  ?.saldoFinal,
                                                              formatType:
                                                              FormatType
                                                                  .decimal,
                                                              decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                              currency: 'R\$ ',
                                                            ),
                                                            'R\$ 0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Readex Pro',
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .secondaryText,
                                                            fontSize: 26,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 4),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                child: Container(
                                                  width: 180,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .height,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .attach_money,
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .secondaryText,
                                                              size: 24,
                                                            ),
                                                            Text(
                                                              'Total Entrada',
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                0.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              totaisViewSaldofinalRow
                                                                  ?.totalEntrada,
                                                              formatType:
                                                              FormatType
                                                                  .decimal,
                                                              decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                              currency: 'R\$ ',
                                                            ),
                                                            'R\$ 0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Readex Pro',
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .success,
                                                            fontSize: 26,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                child: Container(
                                                  width: 180,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .height,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .sadCry,
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .secondaryText,
                                                              size: 24,
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  4,
                                                                  0,
                                                                  0,
                                                                  0),
                                                              child: Text(
                                                                'Gasto Total',
                                                                style: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                  0.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              totaisViewSaldofinalRow
                                                                  ?.totalSaida,
                                                              formatType:
                                                              FormatType
                                                                  .decimal,
                                                              decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                              currency: 'R\$ ',
                                                            ),
                                                            'R\$ 0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Readex Pro',
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .error,
                                                            fontSize: 26,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 550,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Registros Financeiros 💰',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .secondaryText,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 0, 12),
                                              child: Builder(
                                                builder: (context) {
                                                  final listaRegistros =
                                                  conteudoRegistrosRowList
                                                      .toList();

                                                  return FlutterFlowDataTable<
                                                      RegistrosRow>(
                                                    controller: _model
                                                        .paginatedDataTableController,
                                                    data: listaRegistros,
                                                    columnsBuilder:
                                                        (onSortChanged) => [
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Descrição',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .labelLarge
                                                                .override(
                                                              fontFamily:
                                                              'Readex Pro',
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryBackground,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Categoria',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .labelLarge
                                                                .override(
                                                              fontFamily:
                                                              'Readex Pro',
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryBackground,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Tipo',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .labelLarge
                                                                .override(
                                                              fontFamily:
                                                              'Readex Pro',
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryBackground,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Valor',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .labelLarge
                                                                .override(
                                                              fontFamily:
                                                              'Readex Pro',
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryBackground,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    dataRowBuilder:
                                                        (listaRegistrosItem,
                                                        listaRegistrosIndex,
                                                        selected,
                                                        onSelectChanged) =>
                                                        DataRow(
                                                          color:
                                                          MaterialStateProperty
                                                              .all(
                                                            listaRegistrosIndex %
                                                                2 ==
                                                                0
                                                                ? FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground
                                                                : FlutterFlowTheme
                                                                .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          cells: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor: Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                  true,
                                                                  backgroundColor:
                                                                  Color(
                                                                      0x7F000000),
                                                                  enableDrag: false,
                                                                  context: context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                          context),
                                                                      child:
                                                                      EditarRegistroWidget(
                                                                        registroRow:
                                                                        listaRegistrosItem,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                            () {}));
                                                              },
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listaRegistrosItem
                                                                      .descricao,
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Readex Pro',
                                                                  letterSpacing:
                                                                  0.0,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor: Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                  true,
                                                                  backgroundColor:
                                                                  Color(
                                                                      0x7F000000),
                                                                  enableDrag: false,
                                                                  context: context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                          context),
                                                                      child:
                                                                      EditarRegistroWidget(
                                                                        registroRow:
                                                                        listaRegistrosItem,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                            () {}));
                                                              },
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listaRegistrosItem
                                                                      .categoria,
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Readex Pro',
                                                                  letterSpacing:
                                                                  0.0,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor: Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                  true,
                                                                  backgroundColor:
                                                                  Color(
                                                                      0x7F000000),
                                                                  enableDrag: false,
                                                                  context: context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                          context),
                                                                      child:
                                                                      EditarRegistroWidget(
                                                                        registroRow:
                                                                        listaRegistrosItem,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                            () {}));
                                                              },
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listaRegistrosItem
                                                                      .tipo,
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Readex Pro',
                                                                  letterSpacing:
                                                                  0.0,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor: Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                  true,
                                                                  backgroundColor:
                                                                  Color(
                                                                      0x7F000000),
                                                                  enableDrag: false,
                                                                  context: context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                          context),
                                                                      child:
                                                                      EditarRegistroWidget(
                                                                        registroRow:
                                                                        listaRegistrosItem,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                            () {}));
                                                              },
                                                              child: Text(
                                                                formatNumber(
                                                                  listaRegistrosItem
                                                                      .valor!,
                                                                  formatType:
                                                                  FormatType
                                                                      .decimal,
                                                                  decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                                  currency: 'R\$',
                                                                ),
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Readex Pro',
                                                                  letterSpacing:
                                                                  0.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .map((c) =>
                                                              DataCell(c))
                                                              .toList(),
                                                        ),
                                                    paginated: true,
                                                    selectable: false,
                                                    hidePaginator: false,
                                                    showFirstLastButtons: false,
                                                    minWidth: 550,
                                                    headingRowHeight: 56,
                                                    dataRowHeight: 48,
                                                    columnSpacing: 10,
                                                    headingRowColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryText,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    addHorizontalDivider: true,
                                                    addTopAndBottomDivider:
                                                    false,
                                                    hideDefaultHorizontalDivider:
                                                    true,
                                                    horizontalDividerColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    horizontalDividerThickness:
                                                    1,
                                                    addVerticalDivider: false,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
