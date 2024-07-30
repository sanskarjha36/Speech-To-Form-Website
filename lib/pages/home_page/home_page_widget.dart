import '../../flutter_files/flutter_files_animations.dart';
import '../../flutter_files/flutter_files_theme.dart';
import '../../flutter_files/flutter_files_timer.dart';
import '../../flutter_files/flutter_files_util.dart';
import '../../flutter_files/flutter_files_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '../../flutter_files/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 1100.0.ms,
            color: const Color(0xFFFC00FF),
            angle: 0.524,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 800.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 90.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1100.0.ms,
            color: const Color(0xFFFC00FF),
            angle: 0.524,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 900.0.ms,
            color: const Color(0xF8FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1600.0.ms,
            color: FlutterFlowTheme.of(context).tertiary,
            angle: 0,
          ),
        ],
      ),
      'columnOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(12.0, 12.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: const Color(0xFF08FBDE),
            angle: 3.142,
          ),
        ],
      ),
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2500.0.ms,
            begin: 0.0,
            end: 2.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x92EE8B60),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x92EE8B60),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x92EE8B60),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x92EE8B60),
            angle: 0.524,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFA161A1D),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      30.0, 0.0, 30.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: GradientText(
                            'Hello, There',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 50.0,
                                  letterSpacing: 0.0,
                                ),
                            colors: [
                              FlutterFlowTheme.of(context).tertiary,
                              FlutterFlowTheme.of(context).error
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                        ),
                        GradientText(
                          'Try Speech to Fill Form',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 45.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                          colors: [
                            FlutterFlowTheme.of(context).tertiary,
                            FlutterFlowTheme.of(context).error
                          ],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation2']!),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 45.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 60.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(35.0, 25.0, 0.0, 0.0),
                                        child: Container(
                                          width: 400.0,
                                          height: 600.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF1A2123),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 12.0,
                                                color: Color(0x73000000),
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border: Border.all(
                                              color: const Color(0xFF404851),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -1.0, 0.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 24.0,
                                                          12.0, 0.0),
                                                  child: Text(
                                                    FFAppState().stt,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: const Color(
                                                              0xFFA3ACB5),
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation3']!),
                                                ),
                                              ),
                                              if (FFAppState().boolTimer ==
                                                  true)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(3.0,
                                                              5.0, 3.0, 5.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFF15191B),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 6.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              offset:
                                                                  const Offset(
                                                                      0.0, 0.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          border: Border.all(
                                                            width: 0.8,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  16.0,
                                                                  6.0,
                                                                  10.0,
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Start Speaking',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        5.0,
                                                                        3.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child:
                                                                        FlutterFlowTimer(
                                                                      initialTime:
                                                                          _model
                                                                              .timerInitialTimeMs,
                                                                      getDisplayTime:
                                                                          (value) =>
                                                                              StopWatchTimer.getDisplayTime(
                                                                        value,
                                                                        hours:
                                                                            false,
                                                                        milliSecond:
                                                                            false,
                                                                      ),
                                                                      controller:
                                                                          _model
                                                                              .timerController,
                                                                      updateStateInterval:
                                                                          const Duration(
                                                                              milliseconds: 1000),
                                                                      onChanged: (value,
                                                                          displayTime,
                                                                          shouldUpdate) {
                                                                        _model.timerMilliseconds =
                                                                            value;
                                                                        _model.timerValue =
                                                                            displayTime;
                                                                        if (shouldUpdate) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .mic_none_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 24.0,
                                                              ),
                                                            ].divide(
                                                                const SizedBox(
                                                                    width:
                                                                        10.0)),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'rowOnActionTriggerAnimation']!,
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation1']!,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30.0),
                                                  bottomRight:
                                                      Radius.circular(30.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 5.0,
                                                    sigmaY: 7.0,
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0x3914181B),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                30.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                30.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (FFAppState()
                                                                          .bool4 ==
                                                                      true)
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        FFAppState().bool4 =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                        _model
                                                                            .timerController
                                                                            .onStopTimer();
                                                                        FFAppState().stt2 =
                                                                            functions.strToLowerCase(FFAppState().stt)!;
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Stop Speaking',
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .stop_circle_rounded,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: const Color(
                                                                            0x191B1A1A),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: const Color(0xFCFFFFFF),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                        hoverTextColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                          .bool4 ==
                                                                      false)
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        FFAppState().bool4 =
                                                                            true;
                                                                        FFAppState().boolTimer =
                                                                            true;
                                                                        setState(
                                                                            () {});
                                                                        if (FFAppState().bool4 ==
                                                                            true) {
                                                                          await actions
                                                                              .speechToText();
                                                                        } else {
                                                                          return;
                                                                        }

                                                                        FFAppState().fillForm =
                                                                            true;
                                                                        FFAppState().bool1 =
                                                                            true;
                                                                        FFAppState().bool2 =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                        await Future
                                                                            .wait([
                                                                          Future(
                                                                              () async {
                                                                            if (animationsMap['containerOnActionTriggerAnimation1'] !=
                                                                                null) {
                                                                              animationsMap['containerOnActionTriggerAnimation1']!.controller.forward(from: 0.0);
                                                                            }
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            _model.timerController.onStartTimer();
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              animationsMap['rowOnActionTriggerAnimation']!.controller
                                                                                ..reset()
                                                                                ..repeat();
                                                                            }
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            FFAppState().bool1 =
                                                                                true;
                                                                            setState(() {});
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            if (animationsMap['columnOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              animationsMap['columnOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                            }
                                                                          }),
                                                                        ]);
                                                                      },
                                                                      text:
                                                                          'Start Speaking',
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .mic_rounded,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: const Color(0xFCFFFFFF),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                        hoverColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              if (FFAppState()
                                                                      .bool1 ==
                                                                  true)
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    FFAppState()
                                                                            .bool1 =
                                                                        false;
                                                                    FFAppState()
                                                                            .stt =
                                                                        'Speak Something...';
                                                                    FFAppState()
                                                                        .StartLength = '';
                                                                    FFAppState()
                                                                        .StopLength = '';
                                                                    FFAppState()
                                                                        .Defect = '';
                                                                    FFAppState()
                                                                        .Severity = '';
                                                                    FFAppState()
                                                                            .fillForm =
                                                                        false;
                                                                    FFAppState()
                                                                            .bool4 =
                                                                        false;
                                                                    FFAppState()
                                                                            .bool2 =
                                                                        false;
                                                                    FFAppState()
                                                                            .bool6 =
                                                                        false;
                                                                    FFAppState()
                                                                        .counter = 0;
                                                                    FFAppState()
                                                                            .boolTimer =
                                                                        false;
                                                                    FFAppState()
                                                                            .bool7 =
                                                                        false;
                                                                    setState(
                                                                        () {});
                                                                    await Future
                                                                        .wait([
                                                                      Future(
                                                                          () async {
                                                                        if (animationsMap['columnOnActionTriggerAnimation'] !=
                                                                            null) {
                                                                          animationsMap['columnOnActionTriggerAnimation']!
                                                                              .controller
                                                                              .stop();
                                                                        }
                                                                      }),
                                                                      Future(
                                                                          () async {
                                                                        if (animationsMap['containerOnActionTriggerAnimation2'] !=
                                                                            null) {
                                                                          animationsMap['containerOnActionTriggerAnimation2']!
                                                                              .controller
                                                                              .stop();
                                                                        }
                                                                      }),
                                                                      Future(
                                                                          () async {
                                                                        if (animationsMap['imageOnActionTriggerAnimation'] !=
                                                                            null) {
                                                                          animationsMap['imageOnActionTriggerAnimation']!
                                                                              .controller
                                                                              .stop();
                                                                        }
                                                                      }),
                                                                      Future(
                                                                          () async {
                                                                        _model
                                                                            .timerController
                                                                            .onResetTimer();
                                                                      }),
                                                                    ]);
                                                                  },
                                                                  text: 'Reset',
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .restart_alt_rounded,
                                                                    size: 24.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                    hoverColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                ),
                                                            ].divide(
                                                                const SizedBox(
                                                                    width:
                                                                        25.0)),
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
                                    if ((FFAppState().fillForm == true) &&
                                        (FFAppState().stt != ''))
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(35.0, 20.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(70.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await Future.wait([
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation2'] !=
                                                          null) {
                                                        animationsMap[
                                                                'containerOnActionTriggerAnimation2']!
                                                            .controller
                                                          ..reset()
                                                          ..repeat(
                                                              reverse: true);
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'imageOnActionTriggerAnimation'] !=
                                                          null) {
                                                        animationsMap[
                                                                'imageOnActionTriggerAnimation']!
                                                            .controller
                                                          ..reset()
                                                          ..repeat();
                                                      }
                                                    }),
                                                    Future(() async {
                                                      FFAppState().bool2 = true;
                                                      FFAppState().bool4 =
                                                          false;
                                                      FFAppState().stt2 =
                                                          functions
                                                              .strToLowerCase(
                                                                  FFAppState()
                                                                      .stt)!;
                                                      FFAppState().bool7 = true;
                                                      setState(() {});
                                                    }),
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation1'] !=
                                                          null) {
                                                        animationsMap[
                                                                'containerOnActionTriggerAnimation1']!
                                                            .controller
                                                            .stop();
                                                      }
                                                    }),
                                                    Future(() async {
                                                      _model.timerController
                                                          .onResetTimer();
                                                    }),
                                                  ]);
                                                  await Future.wait([
                                                    Future(() async {
                                                      if ((functions.subStringBool(FFAppState().stt2, 'start length') == true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'start lens') ==
                                                              true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'start link') ==
                                                              true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'start length') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StartLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt2,
                                                                            'start length')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'start lens') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StartLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt2,
                                                                            'start lens')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'start link') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StartLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt2,
                                                                            'start link')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                        ]);
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation3'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation3']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        return;
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if ((functions.subStringBool(FFAppState().stt2, 'stop length') == true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'stop lens') ==
                                                              true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'stop link') ==
                                                              true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'stop length') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StopLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt,
                                                                            'stop length')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'stop lens') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StopLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt,
                                                                            'stop lens')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'stop link') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StopLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt,
                                                                            'stop link')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                        ]);
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation3'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation3']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        return;
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if (functions
                                                              .subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'defect') ==
                                                          true) {
                                                        FFAppState().Defect = functions
                                                            .returnInputValue2(
                                                                FFAppState()
                                                                    .stt2,
                                                                (functions.indexOfLastCharOfSubStr(
                                                                        FFAppState()
                                                                            .stt,
                                                                        'defect')!) +
                                                                    2)!;
                                                        setState(() {});
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation5'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation5']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        return;
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if ((functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'sevarity') ==
                                                              true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'severity') ==
                                                              true)) {
                                                        if (functions
                                                                .subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'sevarity') ==
                                                            true) {
                                                          FFAppState()
                                                                  .Severity =
                                                              valueOrDefault<
                                                                  String>(
                                                            functions.returnInputValue(
                                                                FFAppState()
                                                                    .stt2,
                                                                (functions.indexOfLastCharOfSubStr(
                                                                        FFAppState()
                                                                            .stt,
                                                                        'sevarity')!) +
                                                                    2),
                                                            'Input',
                                                          );
                                                          setState(() {});
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation6'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation6']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                        } else {
                                                          FFAppState()
                                                                  .Severity =
                                                              valueOrDefault<
                                                                  String>(
                                                            functions.returnInputValue(
                                                                FFAppState()
                                                                    .stt2,
                                                                (functions.indexOfLastCharOfSubStr(
                                                                        FFAppState()
                                                                            .stt,
                                                                        'severity')!) +
                                                                    2),
                                                            'Input',
                                                          );
                                                          setState(() {});
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation6'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation6']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                        }
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                  ]);
                                                  if (FFAppState().counter >=
                                                      1) {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                                3000));
                                                    unawaited(
                                                      () async {
                                                        FFAppState().bool5 =
                                                            true;
                                                        setState(() {});
                                                      }(),
                                                    );
                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                text: 'Fill Form',
                                                options: FFButtonOptions(
                                                  width: 170.0,
                                                  height: 40.0,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(70.0),
                                                    bottomRight:
                                                        Radius.circular(16.0),
                                                    topLeft:
                                                        Radius.circular(70.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Future.wait([
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation2'] !=
                                                          null) {
                                                        animationsMap[
                                                                'containerOnActionTriggerAnimation2']!
                                                            .controller
                                                          ..reset()
                                                          ..repeat(
                                                              reverse: true);
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'imageOnActionTriggerAnimation'] !=
                                                          null) {
                                                        animationsMap[
                                                                'imageOnActionTriggerAnimation']!
                                                            .controller
                                                          ..reset()
                                                          ..repeat();
                                                      }
                                                    }),
                                                    Future(() async {
                                                      FFAppState().bool2 = true;
                                                      FFAppState().bool4 =
                                                          false;
                                                      FFAppState().stt2 =
                                                          functions
                                                              .strToLowerCase(
                                                                  FFAppState()
                                                                      .stt)!;
                                                      FFAppState().bool7 = true;
                                                      setState(() {});
                                                    }),
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation1'] !=
                                                          null) {
                                                        animationsMap[
                                                                'containerOnActionTriggerAnimation1']!
                                                            .controller
                                                            .stop();
                                                      }
                                                    }),
                                                    Future(() async {
                                                      _model.timerController
                                                          .onResetTimer();
                                                    }),
                                                  ]);
                                                  await Future.wait([
                                                    Future(() async {
                                                      if ((functions.subStringBool(FFAppState().stt2, 'start length') == true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'start lens') ==
                                                              true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'start link') ==
                                                              true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'start length') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StartLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt2,
                                                                            'start length')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'start lens') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StartLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt2,
                                                                            'start lens')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'start link') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StartLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt2,
                                                                            'start link')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                        ]);
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation3'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation3']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        return;
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if ((functions.subStringBool(FFAppState().stt2, 'stop length') == true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'stop lens') ==
                                                              true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'stop link') ==
                                                              true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'stop length') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StopLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt,
                                                                            'stop length')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'stop lens') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StopLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt,
                                                                            'stop lens')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (functions.subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'stop link') ==
                                                                true) {
                                                              FFAppState()
                                                                      .StopLength =
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.returnInputValue(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    (functions.indexOfLastCharOfSubStr(
                                                                            FFAppState().stt,
                                                                            'stop link')!) +
                                                                        2),
                                                                'Input',
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              return;
                                                            }
                                                          }),
                                                        ]);
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation3'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation3']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        return;
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if (functions
                                                              .subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'defect') ==
                                                          true) {
                                                        FFAppState().Defect = functions
                                                            .returnInputValue2(
                                                                FFAppState()
                                                                    .stt2,
                                                                (functions.indexOfLastCharOfSubStr(
                                                                        FFAppState()
                                                                            .stt,
                                                                        'defect')!) +
                                                                    2)!;
                                                        setState(() {});
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation5'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation5']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        return;
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if ((functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'sevarity') ==
                                                              true) ||
                                                          (functions.subStringBool(
                                                                  FFAppState()
                                                                      .stt2,
                                                                  'severity') ==
                                                              true)) {
                                                        if (functions
                                                                .subStringBool(
                                                                    FFAppState()
                                                                        .stt2,
                                                                    'sevarity') ==
                                                            true) {
                                                          FFAppState()
                                                                  .Severity =
                                                              valueOrDefault<
                                                                  String>(
                                                            functions.returnInputValue(
                                                                FFAppState()
                                                                    .stt2,
                                                                (functions.indexOfLastCharOfSubStr(
                                                                        FFAppState()
                                                                            .stt,
                                                                        'sevarity')!) +
                                                                    2),
                                                            'Input',
                                                          );
                                                          setState(() {});
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation6'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation6']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                        } else {
                                                          FFAppState()
                                                                  .Severity =
                                                              valueOrDefault<
                                                                  String>(
                                                            functions.returnInputValue(
                                                                FFAppState()
                                                                    .stt2,
                                                                (functions.indexOfLastCharOfSubStr(
                                                                        FFAppState()
                                                                            .stt,
                                                                        'severity')!) +
                                                                    2),
                                                            'Input',
                                                          );
                                                          setState(() {});
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation6'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation6']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                        }
                                                      } else {
                                                        FFAppState().counter =
                                                            FFAppState()
                                                                    .counter +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    }),
                                                  ]);
                                                  if (FFAppState().counter >=
                                                      1) {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                                2000));
                                                    unawaited(
                                                      () async {
                                                        FFAppState().bool5 =
                                                            true;
                                                        setState(() {});
                                                      }(),
                                                    );
                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(16.0),
                                                      bottomRight:
                                                          Radius.circular(70.0),
                                                      topLeft:
                                                          Radius.circular(16.0),
                                                      topRight:
                                                          Radius.circular(70.0),
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(
                                                const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 35.0, 0.0, 35.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.0),
                                        children: [
                                          if (FFAppState().bool1 == true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                const Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SizedBox(
                                                      height: 200.0,
                                                      child: VerticalDivider(
                                                        thickness: 0.3,
                                                        indent: 0.0,
                                                        endIndent: 7.0,
                                                        color:
                                                            Color(0xFFA3ACB5),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    Container(
                                                      width: 170.0,
                                                      height: 170.0,
                                                      decoration: BoxDecoration(
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x19000000),
                                                            offset: Offset(
                                                                0.0, 0.0),
                                                            spreadRadius: 4.0,
                                                          )
                                                        ],
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                            const Color(
                                                                0xFFEE0FF6)
                                                          ],
                                                          stops: const [
                                                            0.0,
                                                            0.5,
                                                            1.0
                                                          ],
                                                          begin:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              const AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation2']!,
                                                    ),
                                                    Container(
                                                      width: 150.0,
                                                      height: 150.0,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Color(0xFA161A1D),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 12.0,
                                                            color: Color(
                                                                0x67000000),
                                                            offset: Offset(
                                                                0.0, 0.0),
                                                            spreadRadius: 10.0,
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60.0),
                                                          child: Image.asset(
                                                            'assets/images/Freebie-GradientTextures-Preview-03.jpg.webp',
                                                            width: 200.0,
                                                            height: 120.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'imageOnActionTriggerAnimation']!,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SizedBox(
                                                      height: 200.0,
                                                      child: VerticalDivider(
                                                        thickness: 0.3,
                                                        indent: 6.0,
                                                        color:
                                                            Color(0xFFA3ACB5),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'columnOnActionTriggerAnimation']!,
                                            ),
                                          if (FFAppState().fillForm == false)
                                            const Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SizedBox(
                                                      height: 500.0,
                                                      child: VerticalDivider(
                                                        thickness: 0.3,
                                                        indent: 0.0,
                                                        endIndent: 6.0,
                                                        color:
                                                            Color(0xFFA3ACB5),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 20.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 35.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            'START LENGTH: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color:
                                                      const Color(0xFFA3ACB5),
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Container(
                                            width: 400.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1A2123),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 12.0,
                                                  color: Color(0x5A000000),
                                                  offset: Offset(0.0, 0.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  (FFAppState().StartLength ==
                                                              '') &&
                                                          (FFAppState().bool2 ==
                                                              true)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : const Color(0xFF404851),
                                                  const Color(0xFF404851),
                                                ),
                                                width: 0.7,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (FFAppState()
                                                            .StartLength !=
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .StartLength,
                                                              'Input',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .StartLength ==
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            'Input',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFA95A1AC),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    if ((FFAppState()
                                                                .StartLength ==
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    18.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.warning_rounded,
                                                          color:
                                                              Color(0xFFFC9F22),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if ((FFAppState()
                                                                .StartLength !=
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 18.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .checkCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation3']!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            'STOP LENGTH?: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color:
                                                      const Color(0xFFA3ACB5),
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Container(
                                            width: 400.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1A2123),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 12.0,
                                                  color: Color(0x59000000),
                                                  offset: Offset(0.0, 0.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  (FFAppState().StopLength ==
                                                              '') &&
                                                          (FFAppState().bool2 ==
                                                              true)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : const Color(0xFF404851),
                                                  const Color(0xFF404851),
                                                ),
                                                width: 0.7,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (FFAppState()
                                                            .StopLength ==
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            'Input',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFA95A1AC),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .StopLength !=
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .StopLength,
                                                              'Input',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    if ((FFAppState()
                                                                .StopLength !=
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 18.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .checkCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if ((FFAppState()
                                                                .StopLength ==
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    18.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.warning_rounded,
                                                          color:
                                                              Color(0xFFFC9F22),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation4']!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            'DEFECT?:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color:
                                                      const Color(0xFFA3ACB5),
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Container(
                                            width: 400.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1A2123),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 12.0,
                                                  color: Color(0x59000000),
                                                  offset: Offset(0.0, 0.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  (FFAppState().Defect == '') &&
                                                          (FFAppState().bool2 ==
                                                              true)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : const Color(0xFF404851),
                                                  const Color(0xFF404851),
                                                ),
                                                width: 0.7,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (FFAppState().Defect ==
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            'Input',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFA95A1AC),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState().Defect !=
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .Defect,
                                                              'Input',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    if ((FFAppState().Defect ==
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    18.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.warning_rounded,
                                                          color:
                                                              Color(0xFFFC9F22),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if ((FFAppState().Defect !=
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 18.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .checkCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation5']!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            'SEVERITY?: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color:
                                                      const Color(0xFFA3ACB5),
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Container(
                                            width: 400.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1A2123),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 12.0,
                                                  color: Color(0x59000000),
                                                  offset: Offset(0.0, 0.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  (FFAppState().Severity ==
                                                              '') &&
                                                          (FFAppState().bool2 ==
                                                              true)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : const Color(0xFF404851),
                                                  const Color(0xFF404851),
                                                ),
                                                width: 0.7,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (FFAppState().Severity ==
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            'Input',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFA95A1AC),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState().Severity !=
                                                        '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .Severity,
                                                              'Input',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    if ((FFAppState()
                                                                .Severity !=
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 18.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .checkCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if ((FFAppState()
                                                                .Severity ==
                                                            '') &&
                                                        (FFAppState().bool2 ==
                                                            true))
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    18.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.warning_rounded,
                                                          color:
                                                              Color(0xFFFC9F22),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation6']!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (FFAppState().bool7 == true)
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -1.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(35.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  if (FFAppState().bool6 ==
                                                      false)
                                                    Icon(
                                                      Icons
                                                          .cloud_download_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                  if (FFAppState().bool6 ==
                                                      true)
                                                    Icon(
                                                      Icons.cloud_done_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -1.0, 1.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await Future.wait([
                                                      Future(() async {
                                                        FFAppState().addToTotalList(
                                                            'START LENGTH?: ${valueOrDefault<String>(
                                                          FFAppState()
                                                              .StartLength,
                                                          'null (no data passed)',
                                                        )}');
                                                        setState(() {});
                                                      }),
                                                      Future(() async {
                                                        FFAppState().addToTotalList(
                                                            'STOP LENGTH?: ${valueOrDefault<String>(
                                                          FFAppState()
                                                              .StopLength,
                                                          'null (no data passed)',
                                                        )}');
                                                        setState(() {});
                                                      }),
                                                      Future(() async {
                                                        FFAppState().addToTotalList(
                                                            'DEFECT?: ${valueOrDefault<String>(
                                                          FFAppState().Defect,
                                                          'null (no data passed)',
                                                        )}');
                                                        setState(() {});
                                                      }),
                                                      Future(() async {
                                                        FFAppState().addToTotalList(
                                                            'SEVERITY?: ${valueOrDefault<String>(
                                                          FFAppState().Severity,
                                                          'null (no data passed)',
                                                        )}');
                                                        setState(() {});
                                                      }),
                                                    ]);
                                                    await actions.generateXLSX(
                                                      FFAppState()
                                                          .totalList
                                                          .toList(),
                                                    );
                                                    FFAppState().bool6 = true;
                                                    setState(() {});
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation2'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation2']!
                                                          .controller
                                                          .stop();
                                                    }
                                                    if (animationsMap[
                                                            'imageOnActionTriggerAnimation'] !=
                                                        null) {
                                                      animationsMap[
                                                              'imageOnActionTriggerAnimation']!
                                                          .controller
                                                          .stop();
                                                    }
                                                  },
                                                  text: valueOrDefault<String>(
                                                    FFAppState().bool6 == false
                                                        ? 'Download .xlsx'
                                                        : 'Downloaded',
                                                    'Download .xlsx',
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                            24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().bool6 ==
                                                              false
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3
                                                          : const Color(
                                                              0x4B249689),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent3,
                                                    ),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState().bool6 ==
                                                                false
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    hoverBorderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      width: 1.0,
                                                    ),
                                                    hoverTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                ),
                                              ),
                                            ].divide(
                                                const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                  ].divide(const SizedBox(height: 30.0)),
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                ),
                if ((FFAppState().bool5 == true) && (FFAppState().counter >= 1))
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 400.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: const Color(0xF514181B),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 20.0,
                                  color: Color(0x4A000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  spreadRadius: 8.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: const Color(0xFF4E555C),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'It seems like you missed one or more sections!',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 19.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (FFAppState().StartLength == '')
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Text(
                                            'START LENGTH',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      if (FFAppState().StopLength == '')
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Text(
                                            'STOP LENGTH',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      if (FFAppState().Defect == '')
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Text(
                                            'DEFECT',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      if (FFAppState().Severity == '')
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Text(
                                            'SEVERITY',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            unawaited(
                                              () async {
                                                FFAppState().bool5 = false;
                                                setState(() {});
                                              }(),
                                            );
                                          },
                                          text: 'CLOSE',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xF9262D34),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
