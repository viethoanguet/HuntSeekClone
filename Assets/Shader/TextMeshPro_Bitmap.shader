//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TextMeshPro/Bitmap" {
Properties {
_MainTex ("Font Atlas", 2D) = "white" { }
_FaceTex ("Font Texture", 2D) = "white" { }
_FaceColor ("Text Color", Color) = (1,1,1,1)
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
_MaskSoftnessX ("Mask SoftnessX", Float) = 0
_MaskSoftnessY ("Mask SoftnessY", Float) = 0
_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 47968
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = unity_roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat10_0.x = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat10_0.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = unity_roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat10_0.x = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = vs_COLOR0.w * u_xlat10_0.x + -0.00100000005;
    u_xlat16_3 = u_xlat10_0.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_3;
    u_xlatb0 = u_xlat16_1<0.0;
    if(u_xlatb0){discard;}
    u_xlat10_0.xyz = texture2D(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = vs_COLOR0.w * u_xlat16_0.x + -0.00100000005;
    u_xlat16_3 = u_xlat16_0.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = unity_roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat16_2 = u_xlat1.y * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    u_xlat10_0.x = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_5 = u_xlat10_0.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2 * u_xlat16_5;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = texture(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat1.y * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_5 = u_xlat16_0.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2 * u_xlat16_5;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = unity_roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat10_0.x = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_3 = u_xlat10_0.x * vs_COLOR0.w;
    u_xlat16_5 = u_xlat16_3 * u_xlat16_1 + -0.00100000005;
    u_xlat16_3 = u_xlat16_1 * u_xlat16_3;
    SV_Target0.w = u_xlat16_3;
    u_xlatb0 = u_xlat16_5<0.0;
    if(u_xlatb0){discard;}
    u_xlat10_0.xyz = texture2D(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceTex_ST;
uniform 	mediump vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = in_POSITION0.w * 0.5;
    u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
    u_xlat6.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.xy = roundEven(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat1.ww * u_xlat6.xy;
    gl_Position.zw = u_xlat1.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat6.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.y = (-u_xlat6.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat6.xy = u_xlat6.xy * _FaceTex_ST.xy;
    vs_TEXCOORD1.xy = u_xlat6.xy * vec2(0.001953125, 0.001953125) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat6.x = _ScreenParams.x * hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat6.y = _ScreenParams.y * hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat1.ww / abs(u_xlat6.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat0.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_3 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_5 = u_xlat16_3 * u_xlat16_1 + -0.00100000005;
    u_xlat16_3 = u_xlat16_1 * u_xlat16_3;
    SV_Target0.w = u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_5<0.0);
#else
    u_xlatb0 = u_xlat16_5<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_FaceTex, vs_TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat0.xyz;
    return;
}

#endif
"
}
}
}
}
CustomEditor "TMPro.EditorUtilities.TMP_BitmapShaderGUI"
}