//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/SubpixelMorphologicalAntialiasing" {
Properties {
_StencilRef ("_StencilRef", Float) = 64
_StencilMask ("_StencilMask", Float) = 64
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Stencil {
   WriteMask 0
   Comp Always
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 14739
Program "vp" {
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_LOW" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD2 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD3 = _Metrics.xyxy * vec4(-2.0, 0.0, 0.0, -2.0) + in_TEXCOORD0.xyxy;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat6;
float u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_1.xyz);
    u_xlat18 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat2.x = max(abs(u_xlat2.z), u_xlat18);
    u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD1.zw).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_3.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat2.y = max(abs(u_xlat4.z), u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006)).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat18 = dot(u_xlat14.xy, vec2(1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18==0.0);
#else
    u_xlatb18 = u_xlat18==0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat4.x = max(abs(u_xlat4.z), u_xlat18);
    u_xlat10_5.xyz = texture(_ColorTexture, vs_TEXCOORD2.zw).xyz;
    u_xlat0.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_5.xyz);
    u_xlat0.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4.y = max(abs(u_xlat0.z), u_xlat0.x);
    u_xlat0.xy = max(u_xlat2.xy, u_xlat4.xy);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = abs(u_xlat10_1.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat1.x = max(abs(u_xlat1.z), u_xlat12);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.zw).xyz;
    u_xlat3.xyz = abs(u_xlat10_3.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat3.y), abs(u_xlat3.x));
    u_xlat1.y = max(abs(u_xlat3.z), u_xlat12);
    u_xlat0.xy = max(u_xlat0.xy, u_xlat1.xy);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat6.xy = u_xlat2.xy + u_xlat2.xy;
    u_xlatb0.xy = greaterThanEqual(u_xlat6.xyxx, u_xlat0.xxxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat14.xy;
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_MEDIUM" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD2 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD3 = _Metrics.xyxy * vec4(-2.0, 0.0, 0.0, -2.0) + in_TEXCOORD0.xyxy;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat6;
float u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_1.xyz);
    u_xlat18 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat2.x = max(abs(u_xlat2.z), u_xlat18);
    u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD1.zw).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_3.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat2.y = max(abs(u_xlat4.z), u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat18 = dot(u_xlat14.xy, vec2(1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18==0.0);
#else
    u_xlatb18 = u_xlat18==0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat4.x = max(abs(u_xlat4.z), u_xlat18);
    u_xlat10_5.xyz = texture(_ColorTexture, vs_TEXCOORD2.zw).xyz;
    u_xlat0.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_5.xyz);
    u_xlat0.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4.y = max(abs(u_xlat0.z), u_xlat0.x);
    u_xlat0.xy = max(u_xlat2.xy, u_xlat4.xy);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = abs(u_xlat10_1.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat1.x = max(abs(u_xlat1.z), u_xlat12);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.zw).xyz;
    u_xlat3.xyz = abs(u_xlat10_3.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat3.y), abs(u_xlat3.x));
    u_xlat1.y = max(abs(u_xlat3.z), u_xlat12);
    u_xlat0.xy = max(u_xlat0.xy, u_xlat1.xy);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat6.xy = u_xlat2.xy + u_xlat2.xy;
    u_xlatb0.xy = greaterThanEqual(u_xlat6.xyxx, u_xlat0.xxxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat14.xy;
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_HIGH" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD2 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD3 = _Metrics.xyxy * vec4(-2.0, 0.0, 0.0, -2.0) + in_TEXCOORD0.xyxy;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat6;
float u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_1.xyz);
    u_xlat18 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat2.x = max(abs(u_xlat2.z), u_xlat18);
    u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD1.zw).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_3.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat2.y = max(abs(u_xlat4.z), u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat18 = dot(u_xlat14.xy, vec2(1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18==0.0);
#else
    u_xlatb18 = u_xlat18==0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat4.x = max(abs(u_xlat4.z), u_xlat18);
    u_xlat10_5.xyz = texture(_ColorTexture, vs_TEXCOORD2.zw).xyz;
    u_xlat0.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_5.xyz);
    u_xlat0.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4.y = max(abs(u_xlat0.z), u_xlat0.x);
    u_xlat0.xy = max(u_xlat2.xy, u_xlat4.xy);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = abs(u_xlat10_1.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat1.x = max(abs(u_xlat1.z), u_xlat12);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.zw).xyz;
    u_xlat3.xyz = abs(u_xlat10_3.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat3.y), abs(u_xlat3.x));
    u_xlat1.y = max(abs(u_xlat3.z), u_xlat12);
    u_xlat0.xy = max(u_xlat0.xy, u_xlat1.xy);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat6.xy = u_xlat2.xy + u_xlat2.xy;
    u_xlatb0.xy = greaterThanEqual(u_xlat6.xyxx, u_xlat0.xxxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat14.xy;
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_LOW" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + u_xlat0.xyxy;
    vs_TEXCOORD2 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.xyxy;
    vs_TEXCOORD3 = _Metrics.xyxy * vec4(-2.0, 0.0, 0.0, -2.0) + u_xlat0.xyxy;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat6;
float u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_1.xyz);
    u_xlat18 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat2.x = max(abs(u_xlat2.z), u_xlat18);
    u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD1.zw).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_3.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat2.y = max(abs(u_xlat4.z), u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006)).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat18 = dot(u_xlat14.xy, vec2(1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18==0.0);
#else
    u_xlatb18 = u_xlat18==0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat4.x = max(abs(u_xlat4.z), u_xlat18);
    u_xlat10_5.xyz = texture(_ColorTexture, vs_TEXCOORD2.zw).xyz;
    u_xlat0.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_5.xyz);
    u_xlat0.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4.y = max(abs(u_xlat0.z), u_xlat0.x);
    u_xlat0.xy = max(u_xlat2.xy, u_xlat4.xy);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = abs(u_xlat10_1.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat1.x = max(abs(u_xlat1.z), u_xlat12);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.zw).xyz;
    u_xlat3.xyz = abs(u_xlat10_3.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat3.y), abs(u_xlat3.x));
    u_xlat1.y = max(abs(u_xlat3.z), u_xlat12);
    u_xlat0.xy = max(u_xlat0.xy, u_xlat1.xy);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat6.xy = u_xlat2.xy + u_xlat2.xy;
    u_xlatb0.xy = greaterThanEqual(u_xlat6.xyxx, u_xlat0.xxxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat14.xy;
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_MEDIUM" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + u_xlat0.xyxy;
    vs_TEXCOORD2 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.xyxy;
    vs_TEXCOORD3 = _Metrics.xyxy * vec4(-2.0, 0.0, 0.0, -2.0) + u_xlat0.xyxy;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat6;
float u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_1.xyz);
    u_xlat18 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat2.x = max(abs(u_xlat2.z), u_xlat18);
    u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD1.zw).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_3.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat2.y = max(abs(u_xlat4.z), u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat18 = dot(u_xlat14.xy, vec2(1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18==0.0);
#else
    u_xlatb18 = u_xlat18==0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat4.x = max(abs(u_xlat4.z), u_xlat18);
    u_xlat10_5.xyz = texture(_ColorTexture, vs_TEXCOORD2.zw).xyz;
    u_xlat0.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_5.xyz);
    u_xlat0.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4.y = max(abs(u_xlat0.z), u_xlat0.x);
    u_xlat0.xy = max(u_xlat2.xy, u_xlat4.xy);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = abs(u_xlat10_1.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat1.x = max(abs(u_xlat1.z), u_xlat12);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.zw).xyz;
    u_xlat3.xyz = abs(u_xlat10_3.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat3.y), abs(u_xlat3.x));
    u_xlat1.y = max(abs(u_xlat3.z), u_xlat12);
    u_xlat0.xy = max(u_xlat0.xy, u_xlat1.xy);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat6.xy = u_xlat2.xy + u_xlat2.xy;
    u_xlatb0.xy = greaterThanEqual(u_xlat6.xyxx, u_xlat0.xxxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat14.xy;
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_HIGH" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + u_xlat0.xyxy;
    vs_TEXCOORD2 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.xyxy;
    vs_TEXCOORD3 = _Metrics.xyxy * vec4(-2.0, 0.0, 0.0, -2.0) + u_xlat0.xyxy;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat6;
float u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_1.xyz);
    u_xlat18 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat2.x = max(abs(u_xlat2.z), u_xlat18);
    u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD1.zw).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_3.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat2.y = max(abs(u_xlat4.z), u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat18 = dot(u_xlat14.xy, vec2(1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18==0.0);
#else
    u_xlatb18 = u_xlat18==0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat4.x = max(abs(u_xlat4.z), u_xlat18);
    u_xlat10_5.xyz = texture(_ColorTexture, vs_TEXCOORD2.zw).xyz;
    u_xlat0.xyz = abs(u_xlat10_0.xyz) + -abs(u_xlat10_5.xyz);
    u_xlat0.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4.y = max(abs(u_xlat0.z), u_xlat0.x);
    u_xlat0.xy = max(u_xlat2.xy, u_xlat4.xy);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = abs(u_xlat10_1.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat1.x = max(abs(u_xlat1.z), u_xlat12);
    u_xlat10_4.xyz = texture(_ColorTexture, vs_TEXCOORD3.zw).xyz;
    u_xlat3.xyz = abs(u_xlat10_3.xyz) + -abs(u_xlat10_4.xyz);
    u_xlat12 = max(abs(u_xlat3.y), abs(u_xlat3.x));
    u_xlat1.y = max(abs(u_xlat3.z), u_xlat12);
    u_xlat0.xy = max(u_xlat0.xy, u_xlat1.xy);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat6.xy = u_xlat2.xy + u_xlat2.xy;
    u_xlatb0.xy = greaterThanEqual(u_xlat6.xyxx, u_xlat0.xxxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat14.xy;
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Equal
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 72649
Program "vp" {
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_LOW" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Metrics.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = _Metrics.xxyy * vec4(-0.25, 1.25, -0.125, -0.125) + in_TEXCOORD0.xxyy;
    vs_TEXCOORD2 = u_xlat0.xzyw;
    u_xlat1 = _Metrics.xyxy * vec4(-0.125, -0.25, -0.125, 1.25) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD3 = u_xlat1;
    u_xlat0.zw = u_xlat1.yw;
    vs_TEXCOORD4 = _Metrics.xxyy * vec4(-8.0, 8.0, -8.0, 8.0) + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _AreaTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _SearchTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
bool u_xlatb8;
vec2 u_xlat9;
bool u_xlatb9;
float u_xlat12;
mediump float u_xlat10_12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = texture(_ColorTexture, vs_TEXCOORD0.xy).xy;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.yxyy).xy;
    if(u_xlatb0.x){
        u_xlat1.xy = vs_TEXCOORD2.xy;
        u_xlat1.z = 1.0;
        u_xlat2.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb0.x = !!(vs_TEXCOORD4.x<u_xlat1.x);
#else
            u_xlatb0.x = vs_TEXCOORD4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(0.828100026<u_xlat1.z);
#else
            u_xlatb8 = 0.828100026<u_xlat1.z;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(u_xlat2.x==0.0);
#else
            u_xlatb8 = u_xlat2.x==0.0;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
            if(!u_xlatb0.x){break;}
            u_xlat2.xy = textureLod(_ColorTexture, u_xlat1.xy, 0.0).xy;
            u_xlat1.xy = _Metrics.xy * vec2(-2.0, -0.0) + u_xlat1.xy;
            u_xlat1.z = u_xlat2.y;
        }
        u_xlat2.yz = u_xlat1.xz;
        u_xlat0.xz = u_xlat2.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xz, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat1.x = _Metrics.x * u_xlat0.x + u_xlat2.y;
        u_xlat1.y = vs_TEXCOORD3.y;
        u_xlat0.x = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
        u_xlat2.xy = vs_TEXCOORD2.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.x<vs_TEXCOORD4.y);
#else
            u_xlatb12 = u_xlat2.x<vs_TEXCOORD4.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb13 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat3.x==0.0);
#else
            u_xlatb13 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).xy;
            u_xlat2.xy = _Metrics.xy * vec2(2.0, 0.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.xz;
        u_xlat2.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat2.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat1.z = (-_Metrics.x) * u_xlat12 + u_xlat3.y;
        u_xlat1.xw = _Metrics.zz * u_xlat1.xz + (-vs_TEXCOORD1.xx);
        u_xlat1.xw = roundEven(u_xlat1.xw);
        u_xlat1.xw = sqrt(abs(u_xlat1.xw));
        u_xlat5.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat1.zy;
        u_xlat0.z = textureLod(_ColorTexture, u_xlat5.xy, 0.0).x;
        u_xlat0.xz = u_xlat0.xz * vec2(4.0, 4.0);
        u_xlat0.xz = roundEven(u_xlat0.xz);
        u_xlat0.xz = u_xlat0.xz * vec2(16.0, 16.0) + u_xlat1.xw;
        u_xlat0.xz = u_xlat0.xz * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xz = textureLod(_AreaTexture, u_xlat0.xz, 0.0).xy;
        SV_Target0.xy = u_xlat10_0.xz;
    } else {
        SV_Target0.xy = vec2(0.0, 0.0);
    }
    if(u_xlatb0.y){
        u_xlat0.xy = vs_TEXCOORD3.xy;
        u_xlat0.z = 1.0;
        u_xlat1.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(vs_TEXCOORD4.z<u_xlat0.y);
#else
            u_xlatb12 = vs_TEXCOORD4.z<u_xlat0.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat0.z);
#else
            u_xlatb13 = 0.828100026<u_xlat0.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat1.x==0.0);
#else
            u_xlatb13 = u_xlat1.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat1.xy = textureLod(_ColorTexture, u_xlat0.xy, 0.0).yx;
            u_xlat0.xy = _Metrics.xy * vec2(-0.0, -2.0) + u_xlat0.xy;
            u_xlat0.z = u_xlat1.y;
        }
        u_xlat1.yz = u_xlat0.yz;
        u_xlat0.xy = u_xlat1.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xy, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat0.x = _Metrics.y * u_xlat0.x + u_xlat1.y;
        u_xlat0.y = vs_TEXCOORD2.x;
        u_xlat1.x = textureLod(_ColorTexture, u_xlat0.yx, 0.0).y;
        u_xlat2.xy = vs_TEXCOORD3.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.y<vs_TEXCOORD4.w);
#else
            u_xlatb12 = u_xlat2.y<vs_TEXCOORD4.w;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb9 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(u_xlat3.x==0.0);
#else
            u_xlatb9 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
            u_xlat2.xy = _Metrics.xy * vec2(0.0, 2.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.yz;
        u_xlat9.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat9.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat0.z = (-_Metrics.y) * u_xlat12 + u_xlat3.y;
        u_xlat0.xw = _Metrics.ww * u_xlat0.xz + (-vs_TEXCOORD1.yy);
        u_xlat0.xw = roundEven(u_xlat0.xw);
        u_xlat0.xw = sqrt(abs(u_xlat0.xw));
        u_xlat4.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat0.yz;
        u_xlat1.y = textureLod(_ColorTexture, u_xlat4.xy, 0.0).y;
        u_xlat4.xy = u_xlat1.xy * vec2(4.0, 4.0);
        u_xlat4.xy = roundEven(u_xlat4.xy);
        u_xlat0.xy = u_xlat4.xy * vec2(16.0, 16.0) + u_xlat0.xw;
        u_xlat0.xy = u_xlat0.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xy = textureLod(_AreaTexture, u_xlat0.xy, 0.0).xy;
        SV_Target0.zw = u_xlat10_0.xy;
    } else {
        SV_Target0.zw = vec2(0.0, 0.0);
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_MEDIUM" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Metrics.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = _Metrics.xxyy * vec4(-0.25, 1.25, -0.125, -0.125) + in_TEXCOORD0.xxyy;
    vs_TEXCOORD2 = u_xlat0.xzyw;
    u_xlat1 = _Metrics.xyxy * vec4(-0.125, -0.25, -0.125, 1.25) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD3 = u_xlat1;
    u_xlat0.zw = u_xlat1.yw;
    vs_TEXCOORD4 = _Metrics.xxyy * vec4(-16.0, 16.0, -16.0, 16.0) + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _AreaTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _SearchTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
bool u_xlatb8;
vec2 u_xlat9;
bool u_xlatb9;
float u_xlat12;
mediump float u_xlat10_12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = texture(_ColorTexture, vs_TEXCOORD0.xy).xy;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.yxyy).xy;
    if(u_xlatb0.x){
        u_xlat1.xy = vs_TEXCOORD2.xy;
        u_xlat1.z = 1.0;
        u_xlat2.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb0.x = !!(vs_TEXCOORD4.x<u_xlat1.x);
#else
            u_xlatb0.x = vs_TEXCOORD4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(0.828100026<u_xlat1.z);
#else
            u_xlatb8 = 0.828100026<u_xlat1.z;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(u_xlat2.x==0.0);
#else
            u_xlatb8 = u_xlat2.x==0.0;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
            if(!u_xlatb0.x){break;}
            u_xlat2.xy = textureLod(_ColorTexture, u_xlat1.xy, 0.0).xy;
            u_xlat1.xy = _Metrics.xy * vec2(-2.0, -0.0) + u_xlat1.xy;
            u_xlat1.z = u_xlat2.y;
        }
        u_xlat2.yz = u_xlat1.xz;
        u_xlat0.xz = u_xlat2.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xz, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat1.x = _Metrics.x * u_xlat0.x + u_xlat2.y;
        u_xlat1.y = vs_TEXCOORD3.y;
        u_xlat0.x = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
        u_xlat2.xy = vs_TEXCOORD2.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.x<vs_TEXCOORD4.y);
#else
            u_xlatb12 = u_xlat2.x<vs_TEXCOORD4.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb13 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat3.x==0.0);
#else
            u_xlatb13 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).xy;
            u_xlat2.xy = _Metrics.xy * vec2(2.0, 0.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.xz;
        u_xlat2.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat2.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat1.z = (-_Metrics.x) * u_xlat12 + u_xlat3.y;
        u_xlat1.xw = _Metrics.zz * u_xlat1.xz + (-vs_TEXCOORD1.xx);
        u_xlat1.xw = roundEven(u_xlat1.xw);
        u_xlat1.xw = sqrt(abs(u_xlat1.xw));
        u_xlat5.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat1.zy;
        u_xlat0.z = textureLod(_ColorTexture, u_xlat5.xy, 0.0).x;
        u_xlat0.xz = u_xlat0.xz * vec2(4.0, 4.0);
        u_xlat0.xz = roundEven(u_xlat0.xz);
        u_xlat0.xz = u_xlat0.xz * vec2(16.0, 16.0) + u_xlat1.xw;
        u_xlat0.xz = u_xlat0.xz * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xz = textureLod(_AreaTexture, u_xlat0.xz, 0.0).xy;
        SV_Target0.xy = u_xlat10_0.xz;
    } else {
        SV_Target0.xy = vec2(0.0, 0.0);
    }
    if(u_xlatb0.y){
        u_xlat0.xy = vs_TEXCOORD3.xy;
        u_xlat0.z = 1.0;
        u_xlat1.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(vs_TEXCOORD4.z<u_xlat0.y);
#else
            u_xlatb12 = vs_TEXCOORD4.z<u_xlat0.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat0.z);
#else
            u_xlatb13 = 0.828100026<u_xlat0.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat1.x==0.0);
#else
            u_xlatb13 = u_xlat1.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat1.xy = textureLod(_ColorTexture, u_xlat0.xy, 0.0).yx;
            u_xlat0.xy = _Metrics.xy * vec2(-0.0, -2.0) + u_xlat0.xy;
            u_xlat0.z = u_xlat1.y;
        }
        u_xlat1.yz = u_xlat0.yz;
        u_xlat0.xy = u_xlat1.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xy, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat0.x = _Metrics.y * u_xlat0.x + u_xlat1.y;
        u_xlat0.y = vs_TEXCOORD2.x;
        u_xlat1.x = textureLod(_ColorTexture, u_xlat0.yx, 0.0).y;
        u_xlat2.xy = vs_TEXCOORD3.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.y<vs_TEXCOORD4.w);
#else
            u_xlatb12 = u_xlat2.y<vs_TEXCOORD4.w;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb9 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(u_xlat3.x==0.0);
#else
            u_xlatb9 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
            u_xlat2.xy = _Metrics.xy * vec2(0.0, 2.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.yz;
        u_xlat9.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat9.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat0.z = (-_Metrics.y) * u_xlat12 + u_xlat3.y;
        u_xlat0.xw = _Metrics.ww * u_xlat0.xz + (-vs_TEXCOORD1.yy);
        u_xlat0.xw = roundEven(u_xlat0.xw);
        u_xlat0.xw = sqrt(abs(u_xlat0.xw));
        u_xlat4.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat0.yz;
        u_xlat1.y = textureLod(_ColorTexture, u_xlat4.xy, 0.0).y;
        u_xlat4.xy = u_xlat1.xy * vec2(4.0, 4.0);
        u_xlat4.xy = roundEven(u_xlat4.xy);
        u_xlat0.xy = u_xlat4.xy * vec2(16.0, 16.0) + u_xlat0.xw;
        u_xlat0.xy = u_xlat0.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xy = textureLod(_AreaTexture, u_xlat0.xy, 0.0).xy;
        SV_Target0.zw = u_xlat10_0.xy;
    } else {
        SV_Target0.zw = vec2(0.0, 0.0);
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_HIGH" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Metrics.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = _Metrics.xxyy * vec4(-0.25, 1.25, -0.125, -0.125) + in_TEXCOORD0.xxyy;
    vs_TEXCOORD2 = u_xlat0.xzyw;
    u_xlat1 = _Metrics.xyxy * vec4(-0.125, -0.25, -0.125, 1.25) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD3 = u_xlat1;
    u_xlat0.zw = u_xlat1.yw;
    vs_TEXCOORD4 = _Metrics.xxyy * vec4(-32.0, 32.0, -32.0, 32.0) + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _AreaTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _SearchTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat10_3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec2 u_xlat10_5;
vec3 u_xlat6;
mediump float u_xlat10_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat10_7;
bvec3 u_xlatb7;
vec3 u_xlat8;
vec2 u_xlat13;
mediump float u_xlat10_13;
bool u_xlatb13;
vec2 u_xlat14;
bool u_xlatb14;
mediump vec2 u_xlat10_15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat10_18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = texture(_ColorTexture, vs_TEXCOORD0.xy).xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<u_xlat0.y);
#else
    u_xlatb6 = 0.0<u_xlat0.y;
#endif
    if(u_xlatb6){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0.0<u_xlat0.x);
#else
        u_xlatb6 = 0.0<u_xlat0.x;
#endif
        if(u_xlatb6){
            u_xlat1.xy = _Metrics.xy * vec2(-1.0, 1.0);
            u_xlat1.z = 1.0;
            u_xlat2.xy = vs_TEXCOORD0.xy;
            u_xlat6.x = 0.0;
            u_xlat2.z = -1.0;
            u_xlat3.x = 1.0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb18 = !!(u_xlat2.z<7.0);
#else
                u_xlatb18 = u_xlat2.z<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(0.899999976<u_xlat3.x);
#else
                u_xlatb19 = 0.899999976<u_xlat3.x;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb19;
                if(!u_xlatb18){break;}
                u_xlat2.xyz = u_xlat1.xyz + u_xlat2.xyz;
                u_xlat6.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
                u_xlat3.x = dot(u_xlat6.yx, vec2(0.5, 0.5));
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb6 = !!(0.899999976<u_xlat6.x);
#else
            u_xlatb6 = 0.899999976<u_xlat6.x;
#endif
            u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
            u_xlat1.x = u_xlat6.x + u_xlat2.z;
        } else {
            u_xlat1.x = 0.0;
            u_xlat3.x = 0.0;
        }
        u_xlat6.xy = _Metrics.xy * vec2(1.0, -1.0);
        u_xlat6.z = 1.0;
        u_xlat2.yz = vs_TEXCOORD0.xy;
        u_xlat2.x = float(-1.0);
        u_xlat20 = float(1.0);
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb15 = !!(u_xlat2.x<7.0);
#else
            u_xlatb15 = u_xlat2.x<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.899999976<u_xlat20);
#else
            u_xlatb21 = 0.899999976<u_xlat20;
#endif
            u_xlatb15 = u_xlatb21 && u_xlatb15;
            if(!u_xlatb15){break;}
            u_xlat2.xyz = u_xlat6.zxy + u_xlat2.xyz;
            u_xlat10_15.xy = textureLod(_ColorTexture, u_xlat2.yz, 0.0).xy;
            u_xlat20 = dot(u_xlat10_15.xy, vec2(0.5, 0.5));
        }
        u_xlat3.y = u_xlat20;
        u_xlat6.x = u_xlat1.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(2.0<u_xlat6.x);
#else
        u_xlatb6 = 2.0<u_xlat6.x;
#endif
        if(u_xlatb6){
            u_xlat1.y = (-u_xlat1.x) + 0.25;
            u_xlat1.zw = u_xlat2.xx * vec2(1.0, -1.0) + vec2(0.0, -0.25);
            u_xlat2 = u_xlat1.yxzw * _Metrics.xyxy + vs_TEXCOORD0.xyxy;
            u_xlat2 = _Metrics.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat2;
            u_xlat6.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).xy;
            u_xlat10_7.xz = textureLod(_ColorTexture, u_xlat2.zw, 0.0).xy;
            u_xlat6.z = u_xlat10_7.x;
            u_xlat2.xy = u_xlat6.xz * vec2(5.0, 5.0) + vec2(-3.75, -3.75);
            u_xlat6.xz = u_xlat6.xz * abs(u_xlat2.xy);
            u_xlat6.xz = roundEven(u_xlat6.xz);
            u_xlat8.x = roundEven(u_xlat6.y);
            u_xlat8.z = roundEven(u_xlat10_7.z);
            u_xlat6.xy = u_xlat8.xz * vec2(2.0, 2.0) + u_xlat6.xz;
            u_xlatb7.xz = greaterThanEqual(u_xlat3.xxyy, vec4(0.899999976, 0.0, 0.899999976, 0.899999976)).xz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb7.x) ? float(0.0) : u_xlat6.x;
                hlslcc_movcTemp.y = (u_xlatb7.z) ? float(0.0) : u_xlat6.y;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat6.xy = u_xlat6.xy * vec2(20.0, 20.0) + u_xlat1.xz;
            u_xlat6.xy = u_xlat6.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.503125012, 0.000892857148);
            u_xlat6.xy = textureLod(_AreaTexture, u_xlat6.xy, 0.0).xy;
        } else {
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
        }
        u_xlat18 = _Metrics.x * 0.25 + vs_TEXCOORD0.x;
        u_xlat1.xy = (-_Metrics.xy);
        u_xlat1.z = 1.0;
        u_xlat8.x = u_xlat18;
        u_xlat8.y = vs_TEXCOORD0.y;
        u_xlat2.x = float(1.0);
        u_xlat8.z = float(-1.0);
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat8.z<7.0);
#else
            u_xlatb19 = u_xlat8.z<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb3.x = !!(0.899999976<u_xlat2.x);
#else
            u_xlatb3.x = 0.899999976<u_xlat2.x;
#endif
            u_xlatb19 = u_xlatb19 && u_xlatb3.x;
            if(!u_xlatb19){break;}
            u_xlat8.xyz = u_xlat1.xyz + u_xlat8.xyz;
            u_xlat10_3.xy = textureLod(_ColorTexture, u_xlat8.xy, 0.0).xy;
            u_xlat19 = u_xlat10_3.x * 5.0 + -3.75;
            u_xlat19 = abs(u_xlat19) * u_xlat10_3.x;
            u_xlat4.x = roundEven(u_xlat19);
            u_xlat4.y = roundEven(u_xlat10_3.y);
            u_xlat2.x = dot(u_xlat4.xy, vec2(0.5, 0.5));
        }
        u_xlat1.x = u_xlat8.z;
        u_xlat14.xy = _Metrics.xy * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
        u_xlat19 = textureLod(_ColorTexture, u_xlat14.xy, 0.0).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(0.0<u_xlat19);
#else
        u_xlatb19 = 0.0<u_xlat19;
#endif
        if(u_xlatb19){
            u_xlat3.xy = _Metrics.xy;
            u_xlat3.z = 1.0;
            u_xlat4.x = u_xlat18;
            u_xlat4.y = vs_TEXCOORD0.y;
            u_xlat4.z = -1.0;
            u_xlat2.y = float(1.0);
            u_xlat14.x = float(0.0);
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(u_xlat4.z<7.0);
#else
                u_xlatb19 = u_xlat4.z<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(0.899999976<u_xlat2.y);
#else
                u_xlatb21 = 0.899999976<u_xlat2.y;
#endif
                u_xlatb19 = u_xlatb19 && u_xlatb21;
                if(!u_xlatb19){break;}
                u_xlat4.xyz = u_xlat3.xyz + u_xlat4.xyz;
                u_xlat10_5.xy = textureLod(_ColorTexture, u_xlat4.xy, 0.0).xy;
                u_xlat19 = u_xlat10_5.x * 5.0 + -3.75;
                u_xlat19 = abs(u_xlat19) * u_xlat10_5.x;
                u_xlat14.y = roundEven(u_xlat19);
                u_xlat14.x = roundEven(u_xlat10_5.y);
                u_xlat2.y = dot(u_xlat14.yx, vec2(0.5, 0.5));
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.899999976<u_xlat14.x);
#else
            u_xlatb18 = 0.899999976<u_xlat14.x;
#endif
            u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
            u_xlat1.z = u_xlat18 + u_xlat4.z;
        } else {
            u_xlat1.z = 0.0;
            u_xlat2.y = 0.0;
        }
        u_xlat18 = u_xlat1.z + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(2.0<u_xlat18);
#else
        u_xlatb18 = 2.0<u_xlat18;
#endif
        if(u_xlatb18){
            u_xlat1.y = (-u_xlat1.x);
            u_xlat3 = u_xlat1.yyzz * _Metrics.xyxy + vs_TEXCOORD0.xyxy;
            u_xlat4 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + u_xlat3.xyxy;
            u_xlat5.x = textureLod(_ColorTexture, u_xlat4.xy, 0.0).y;
            u_xlat5.z = textureLod(_ColorTexture, u_xlat4.zw, 0.0).x;
            u_xlat7.xz = _Metrics.xy * vec2(1.0, 0.0) + u_xlat3.zw;
            u_xlat5.yw = textureLod(_ColorTexture, u_xlat7.xz, 0.0).yx;
            u_xlat7.xz = u_xlat5.xy * vec2(2.0, 2.0) + u_xlat5.zw;
            u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, vec4(0.899999976, 0.899999976, 0.0, 0.0)).xy;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb2.x) ? float(0.0) : u_xlat7.x;
                hlslcc_movcTemp.z = (u_xlatb2.y) ? float(0.0) : u_xlat7.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat1.xy = u_xlat7.xz * vec2(20.0, 20.0) + u_xlat1.xz;
            u_xlat1.xy = u_xlat1.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.503125012, 0.000892857148);
            u_xlat10_1.xy = textureLod(_AreaTexture, u_xlat1.xy, 0.0).xy;
            u_xlat6.xy = u_xlat6.xy + u_xlat10_1.yx;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!((-u_xlat6.y)==u_xlat6.x);
#else
        u_xlatb18 = (-u_xlat6.y)==u_xlat6.x;
#endif
        if(u_xlatb18){
            u_xlat1.xy = vs_TEXCOORD2.xy;
            u_xlat1.z = 1.0;
            u_xlat2.x = 0.0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb18 = !!(vs_TEXCOORD4.x<u_xlat1.x);
#else
                u_xlatb18 = vs_TEXCOORD4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(0.828100026<u_xlat1.z);
#else
                u_xlatb19 = 0.828100026<u_xlat1.z;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb19;
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(u_xlat2.x==0.0);
#else
                u_xlatb19 = u_xlat2.x==0.0;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb19;
                if(!u_xlatb18){break;}
                u_xlat2.xy = textureLod(_ColorTexture, u_xlat1.xy, 0.0).xy;
                u_xlat1.xy = _Metrics.xy * vec2(-2.0, -0.0) + u_xlat1.xy;
                u_xlat1.z = u_xlat2.y;
            }
            u_xlat2.yz = u_xlat1.xz;
            u_xlat1.xy = u_xlat2.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
            u_xlat10_18 = textureLod(_SearchTexture, u_xlat1.xy, 0.0).w;
            u_xlat18 = u_xlat10_18 * -2.00787401 + 3.25;
            u_xlat1.x = _Metrics.x * u_xlat18 + u_xlat2.y;
            u_xlat1.y = vs_TEXCOORD3.y;
            u_xlat2.x = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
            u_xlat3.xy = vs_TEXCOORD2.zw;
            u_xlat3.z = 1.0;
            u_xlat4.x = 0.0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb18 = !!(u_xlat3.x<vs_TEXCOORD4.y);
#else
                u_xlatb18 = u_xlat3.x<vs_TEXCOORD4.y;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb14 = !!(0.828100026<u_xlat3.z);
#else
                u_xlatb14 = 0.828100026<u_xlat3.z;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb14;
#ifdef UNITY_ADRENO_ES3
                u_xlatb14 = !!(u_xlat4.x==0.0);
#else
                u_xlatb14 = u_xlat4.x==0.0;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb14;
                if(!u_xlatb18){break;}
                u_xlat4.xy = textureLod(_ColorTexture, u_xlat3.xy, 0.0).xy;
                u_xlat3.xy = _Metrics.xy * vec2(2.0, 0.0) + u_xlat3.xy;
                u_xlat3.z = u_xlat4.y;
            }
            u_xlat4.yz = u_xlat3.xz;
            u_xlat14.xy = u_xlat4.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
            u_xlat10_18 = textureLod(_SearchTexture, u_xlat14.xy, 0.0).w;
            u_xlat18 = u_xlat10_18 * -2.00787401 + 3.25;
            u_xlat1.z = (-_Metrics.x) * u_xlat18 + u_xlat4.y;
            u_xlat3 = _Metrics.zzzz * u_xlat1.zxzx + (-vs_TEXCOORD1.xxxx);
            u_xlat3 = roundEven(u_xlat3);
            u_xlat14.xy = sqrt(abs(u_xlat3.wz));
            u_xlat4.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat1.zy;
            u_xlat2.y = textureLod(_ColorTexture, u_xlat4.xy, 0.0).x;
            u_xlat2.xy = u_xlat2.xy * vec2(4.0, 4.0);
            u_xlat2.xy = roundEven(u_xlat2.xy);
            u_xlat2.xy = u_xlat2.xy * vec2(16.0, 16.0) + u_xlat14.xy;
            u_xlat2.xy = u_xlat2.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
            u_xlat10_2.xy = textureLod(_AreaTexture, u_xlat2.xy, 0.0).xy;
            u_xlatb3 = greaterThanEqual(abs(u_xlat3), abs(u_xlat3.wzwz));
            u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
            u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
            u_xlat3.z = u_xlatb3.z ? float(0.75) : 0.0;
            u_xlat3.w = u_xlatb3.w ? float(0.75) : 0.0;
;
            u_xlat18 = u_xlat3.y + u_xlat3.x;
            u_xlat14.xy = u_xlat3.zw / vec2(u_xlat18);
            u_xlat1.w = vs_TEXCOORD0.y;
            u_xlat3.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat1.xw;
            u_xlat10_18 = textureLod(_ColorTexture, u_xlat3.xy, 0.0).x;
            u_xlat18 = (-u_xlat14.x) * u_xlat10_18 + 1.0;
            u_xlat3.xy = u_xlat1.zw + _Metrics.xy;
            u_xlat10_7.x = textureLod(_ColorTexture, u_xlat3.xy, 0.0).x;
            u_xlat3.x = (-u_xlat14.y) * u_xlat10_7.x + u_xlat18;
#ifdef UNITY_ADRENO_ES3
            u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
            u_xlat1 = _Metrics.xyxy * vec4(0.0, -2.0, 1.0, -2.0) + u_xlat1.xwzw;
            u_xlat10_18 = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
            u_xlat18 = (-u_xlat14.x) * u_xlat10_18 + 1.0;
            u_xlat10_1.x = textureLod(_ColorTexture, u_xlat1.zw, 0.0).x;
            u_xlat3.y = (-u_xlat14.y) * u_xlat10_1.x + u_xlat18;
#ifdef UNITY_ADRENO_ES3
            u_xlat3.y = min(max(u_xlat3.y, 0.0), 1.0);
#else
            u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
#endif
            SV_Target0.xy = u_xlat10_2.xy * u_xlat3.xy;
        } else {
            SV_Target0.xy = u_xlat6.xy;
            u_xlat0.x = 0.0;
        }
    } else {
        SV_Target0.xy = vec2(0.0, 0.0);
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat0.x);
#else
    u_xlatb0 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD3.xy;
        u_xlat0.z = 1.0;
        u_xlat1.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(vs_TEXCOORD4.z<u_xlat0.y);
#else
            u_xlatb18 = vs_TEXCOORD4.z<u_xlat0.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(0.828100026<u_xlat0.z);
#else
            u_xlatb19 = 0.828100026<u_xlat0.z;
#endif
            u_xlatb18 = u_xlatb18 && u_xlatb19;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat1.x==0.0);
#else
            u_xlatb19 = u_xlat1.x==0.0;
#endif
            u_xlatb18 = u_xlatb18 && u_xlatb19;
            if(!u_xlatb18){break;}
            u_xlat1.xy = textureLod(_ColorTexture, u_xlat0.xy, 0.0).yx;
            u_xlat0.xy = _Metrics.xy * vec2(-0.0, -2.0) + u_xlat0.xy;
            u_xlat0.z = u_xlat1.y;
        }
        u_xlat1.yz = u_xlat0.yz;
        u_xlat0.xy = u_xlat1.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0 = textureLod(_SearchTexture, u_xlat0.xy, 0.0).w;
        u_xlat0.x = u_xlat10_0 * -2.00787401 + 3.25;
        u_xlat0.x = _Metrics.y * u_xlat0.x + u_xlat1.y;
        u_xlat0.y = vs_TEXCOORD2.x;
        u_xlat1.x = textureLod(_ColorTexture, u_xlat0.yx, 0.0).y;
        u_xlat2.xy = vs_TEXCOORD3.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat2.y<vs_TEXCOORD4.w);
#else
            u_xlatb13 = u_xlat2.y<vs_TEXCOORD4.w;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb19 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb13 = u_xlatb19 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat3.x==0.0);
#else
            u_xlatb19 = u_xlat3.x==0.0;
#endif
            u_xlatb13 = u_xlatb19 && u_xlatb13;
            if(!u_xlatb13){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
            u_xlat2.xy = _Metrics.xy * vec2(0.0, 2.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.yz;
        u_xlat13.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_13 = textureLod(_SearchTexture, u_xlat13.xy, 0.0).w;
        u_xlat13.x = u_xlat10_13 * -2.00787401 + 3.25;
        u_xlat0.z = (-_Metrics.y) * u_xlat13.x + u_xlat3.y;
        u_xlat2 = _Metrics.wwww * u_xlat0.zxzx + (-vs_TEXCOORD1.yyyy);
        u_xlat2 = roundEven(u_xlat2);
        u_xlat13.xy = sqrt(abs(u_xlat2.wz));
        u_xlat3.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat0.yz;
        u_xlat1.y = textureLod(_ColorTexture, u_xlat3.xy, 0.0).y;
        u_xlat1.xy = u_xlat1.xy * vec2(4.0, 4.0);
        u_xlat1.xy = roundEven(u_xlat1.xy);
        u_xlat1.xy = u_xlat1.xy * vec2(16.0, 16.0) + u_xlat13.xy;
        u_xlat1.xy = u_xlat1.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_1.xy = textureLod(_AreaTexture, u_xlat1.xy, 0.0).xy;
        u_xlatb2 = greaterThanEqual(abs(u_xlat2), abs(u_xlat2.wzwz));
        u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
        u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
        u_xlat2.z = u_xlatb2.z ? float(0.75) : 0.0;
        u_xlat2.w = u_xlatb2.w ? float(0.75) : 0.0;
;
        u_xlat6.x = u_xlat2.y + u_xlat2.x;
        u_xlat13.xy = u_xlat2.zw / u_xlat6.xx;
        u_xlat0.w = vs_TEXCOORD0.x;
        u_xlat2.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat0.wx;
        u_xlat10_6 = textureLod(_ColorTexture, u_xlat2.xy, 0.0).y;
        u_xlat6.x = (-u_xlat13.x) * u_xlat10_6 + 1.0;
        u_xlat2.xy = u_xlat0.wz + _Metrics.xy;
        u_xlat10_2.x = textureLod(_ColorTexture, u_xlat2.xy, 0.0).y;
        u_xlat14.x = (-u_xlat13.y) * u_xlat10_2.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
        u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
        u_xlat0 = _Metrics.xyxy * vec4(-2.0, 0.0, -2.0, 1.0) + u_xlat0.wxwz;
        u_xlat10_0 = textureLod(_ColorTexture, u_xlat0.xy, 0.0).y;
        u_xlat0.x = (-u_xlat13.x) * u_xlat10_0 + 1.0;
        u_xlat10_6 = textureLod(_ColorTexture, u_xlat0.zw, 0.0).y;
        u_xlat14.y = (-u_xlat13.y) * u_xlat10_6 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat14.y = min(max(u_xlat14.y, 0.0), 1.0);
#else
        u_xlat14.y = clamp(u_xlat14.y, 0.0, 1.0);
#endif
        SV_Target0.zw = u_xlat10_1.xy * u_xlat14.xy;
    } else {
        SV_Target0.zw = vec2(0.0, 0.0);
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_LOW" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec4 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * _Metrics.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
    u_xlat1 = _Metrics.xxyy * vec4(-0.25, 1.25, -0.125, -0.125) + u_xlat0.xxyy;
    u_xlat0 = _Metrics.xyxy * vec4(-0.125, -0.25, -0.125, 1.25) + u_xlat0.xyxy;
    vs_TEXCOORD2 = u_xlat1.xzyw;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.zw = u_xlat0.yw;
    vs_TEXCOORD4 = _Metrics.xxyy * vec4(-8.0, 8.0, -8.0, 8.0) + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _AreaTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _SearchTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
bool u_xlatb8;
vec2 u_xlat9;
bool u_xlatb9;
float u_xlat12;
mediump float u_xlat10_12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = texture(_ColorTexture, vs_TEXCOORD0.xy).xy;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.yxyy).xy;
    if(u_xlatb0.x){
        u_xlat1.xy = vs_TEXCOORD2.xy;
        u_xlat1.z = 1.0;
        u_xlat2.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb0.x = !!(vs_TEXCOORD4.x<u_xlat1.x);
#else
            u_xlatb0.x = vs_TEXCOORD4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(0.828100026<u_xlat1.z);
#else
            u_xlatb8 = 0.828100026<u_xlat1.z;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(u_xlat2.x==0.0);
#else
            u_xlatb8 = u_xlat2.x==0.0;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
            if(!u_xlatb0.x){break;}
            u_xlat2.xy = textureLod(_ColorTexture, u_xlat1.xy, 0.0).xy;
            u_xlat1.xy = _Metrics.xy * vec2(-2.0, -0.0) + u_xlat1.xy;
            u_xlat1.z = u_xlat2.y;
        }
        u_xlat2.yz = u_xlat1.xz;
        u_xlat0.xz = u_xlat2.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xz, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat1.x = _Metrics.x * u_xlat0.x + u_xlat2.y;
        u_xlat1.y = vs_TEXCOORD3.y;
        u_xlat0.x = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
        u_xlat2.xy = vs_TEXCOORD2.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.x<vs_TEXCOORD4.y);
#else
            u_xlatb12 = u_xlat2.x<vs_TEXCOORD4.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb13 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat3.x==0.0);
#else
            u_xlatb13 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).xy;
            u_xlat2.xy = _Metrics.xy * vec2(2.0, 0.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.xz;
        u_xlat2.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat2.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat1.z = (-_Metrics.x) * u_xlat12 + u_xlat3.y;
        u_xlat1.xw = _Metrics.zz * u_xlat1.xz + (-vs_TEXCOORD1.xx);
        u_xlat1.xw = roundEven(u_xlat1.xw);
        u_xlat1.xw = sqrt(abs(u_xlat1.xw));
        u_xlat5.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat1.zy;
        u_xlat0.z = textureLod(_ColorTexture, u_xlat5.xy, 0.0).x;
        u_xlat0.xz = u_xlat0.xz * vec2(4.0, 4.0);
        u_xlat0.xz = roundEven(u_xlat0.xz);
        u_xlat0.xz = u_xlat0.xz * vec2(16.0, 16.0) + u_xlat1.xw;
        u_xlat0.xz = u_xlat0.xz * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xz = textureLod(_AreaTexture, u_xlat0.xz, 0.0).xy;
        SV_Target0.xy = u_xlat10_0.xz;
    } else {
        SV_Target0.xy = vec2(0.0, 0.0);
    }
    if(u_xlatb0.y){
        u_xlat0.xy = vs_TEXCOORD3.xy;
        u_xlat0.z = 1.0;
        u_xlat1.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(vs_TEXCOORD4.z<u_xlat0.y);
#else
            u_xlatb12 = vs_TEXCOORD4.z<u_xlat0.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat0.z);
#else
            u_xlatb13 = 0.828100026<u_xlat0.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat1.x==0.0);
#else
            u_xlatb13 = u_xlat1.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat1.xy = textureLod(_ColorTexture, u_xlat0.xy, 0.0).yx;
            u_xlat0.xy = _Metrics.xy * vec2(-0.0, -2.0) + u_xlat0.xy;
            u_xlat0.z = u_xlat1.y;
        }
        u_xlat1.yz = u_xlat0.yz;
        u_xlat0.xy = u_xlat1.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xy, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat0.x = _Metrics.y * u_xlat0.x + u_xlat1.y;
        u_xlat0.y = vs_TEXCOORD2.x;
        u_xlat1.x = textureLod(_ColorTexture, u_xlat0.yx, 0.0).y;
        u_xlat2.xy = vs_TEXCOORD3.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.y<vs_TEXCOORD4.w);
#else
            u_xlatb12 = u_xlat2.y<vs_TEXCOORD4.w;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb9 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(u_xlat3.x==0.0);
#else
            u_xlatb9 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
            u_xlat2.xy = _Metrics.xy * vec2(0.0, 2.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.yz;
        u_xlat9.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat9.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat0.z = (-_Metrics.y) * u_xlat12 + u_xlat3.y;
        u_xlat0.xw = _Metrics.ww * u_xlat0.xz + (-vs_TEXCOORD1.yy);
        u_xlat0.xw = roundEven(u_xlat0.xw);
        u_xlat0.xw = sqrt(abs(u_xlat0.xw));
        u_xlat4.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat0.yz;
        u_xlat1.y = textureLod(_ColorTexture, u_xlat4.xy, 0.0).y;
        u_xlat4.xy = u_xlat1.xy * vec2(4.0, 4.0);
        u_xlat4.xy = roundEven(u_xlat4.xy);
        u_xlat0.xy = u_xlat4.xy * vec2(16.0, 16.0) + u_xlat0.xw;
        u_xlat0.xy = u_xlat0.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xy = textureLod(_AreaTexture, u_xlat0.xy, 0.0).xy;
        SV_Target0.zw = u_xlat10_0.xy;
    } else {
        SV_Target0.zw = vec2(0.0, 0.0);
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_MEDIUM" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec4 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * _Metrics.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
    u_xlat1 = _Metrics.xxyy * vec4(-0.25, 1.25, -0.125, -0.125) + u_xlat0.xxyy;
    u_xlat0 = _Metrics.xyxy * vec4(-0.125, -0.25, -0.125, 1.25) + u_xlat0.xyxy;
    vs_TEXCOORD2 = u_xlat1.xzyw;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.zw = u_xlat0.yw;
    vs_TEXCOORD4 = _Metrics.xxyy * vec4(-16.0, 16.0, -16.0, 16.0) + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _AreaTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _SearchTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
bool u_xlatb8;
vec2 u_xlat9;
bool u_xlatb9;
float u_xlat12;
mediump float u_xlat10_12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = texture(_ColorTexture, vs_TEXCOORD0.xy).xy;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.yxyy).xy;
    if(u_xlatb0.x){
        u_xlat1.xy = vs_TEXCOORD2.xy;
        u_xlat1.z = 1.0;
        u_xlat2.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb0.x = !!(vs_TEXCOORD4.x<u_xlat1.x);
#else
            u_xlatb0.x = vs_TEXCOORD4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(0.828100026<u_xlat1.z);
#else
            u_xlatb8 = 0.828100026<u_xlat1.z;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
            u_xlatb8 = !!(u_xlat2.x==0.0);
#else
            u_xlatb8 = u_xlat2.x==0.0;
#endif
            u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
            if(!u_xlatb0.x){break;}
            u_xlat2.xy = textureLod(_ColorTexture, u_xlat1.xy, 0.0).xy;
            u_xlat1.xy = _Metrics.xy * vec2(-2.0, -0.0) + u_xlat1.xy;
            u_xlat1.z = u_xlat2.y;
        }
        u_xlat2.yz = u_xlat1.xz;
        u_xlat0.xz = u_xlat2.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xz, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat1.x = _Metrics.x * u_xlat0.x + u_xlat2.y;
        u_xlat1.y = vs_TEXCOORD3.y;
        u_xlat0.x = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
        u_xlat2.xy = vs_TEXCOORD2.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.x<vs_TEXCOORD4.y);
#else
            u_xlatb12 = u_xlat2.x<vs_TEXCOORD4.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb13 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat3.x==0.0);
#else
            u_xlatb13 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).xy;
            u_xlat2.xy = _Metrics.xy * vec2(2.0, 0.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.xz;
        u_xlat2.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat2.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat1.z = (-_Metrics.x) * u_xlat12 + u_xlat3.y;
        u_xlat1.xw = _Metrics.zz * u_xlat1.xz + (-vs_TEXCOORD1.xx);
        u_xlat1.xw = roundEven(u_xlat1.xw);
        u_xlat1.xw = sqrt(abs(u_xlat1.xw));
        u_xlat5.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat1.zy;
        u_xlat0.z = textureLod(_ColorTexture, u_xlat5.xy, 0.0).x;
        u_xlat0.xz = u_xlat0.xz * vec2(4.0, 4.0);
        u_xlat0.xz = roundEven(u_xlat0.xz);
        u_xlat0.xz = u_xlat0.xz * vec2(16.0, 16.0) + u_xlat1.xw;
        u_xlat0.xz = u_xlat0.xz * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xz = textureLod(_AreaTexture, u_xlat0.xz, 0.0).xy;
        SV_Target0.xy = u_xlat10_0.xz;
    } else {
        SV_Target0.xy = vec2(0.0, 0.0);
    }
    if(u_xlatb0.y){
        u_xlat0.xy = vs_TEXCOORD3.xy;
        u_xlat0.z = 1.0;
        u_xlat1.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(vs_TEXCOORD4.z<u_xlat0.y);
#else
            u_xlatb12 = vs_TEXCOORD4.z<u_xlat0.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(0.828100026<u_xlat0.z);
#else
            u_xlatb13 = 0.828100026<u_xlat0.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat1.x==0.0);
#else
            u_xlatb13 = u_xlat1.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb13;
            if(!u_xlatb12){break;}
            u_xlat1.xy = textureLod(_ColorTexture, u_xlat0.xy, 0.0).yx;
            u_xlat0.xy = _Metrics.xy * vec2(-0.0, -2.0) + u_xlat0.xy;
            u_xlat0.z = u_xlat1.y;
        }
        u_xlat1.yz = u_xlat0.yz;
        u_xlat0.xy = u_xlat1.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0.xy, 0.0).w;
        u_xlat0.x = u_xlat10_0.x * -2.00787401 + 3.25;
        u_xlat0.x = _Metrics.y * u_xlat0.x + u_xlat1.y;
        u_xlat0.y = vs_TEXCOORD2.x;
        u_xlat1.x = textureLod(_ColorTexture, u_xlat0.yx, 0.0).y;
        u_xlat2.xy = vs_TEXCOORD3.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb12 = !!(u_xlat2.y<vs_TEXCOORD4.w);
#else
            u_xlatb12 = u_xlat2.y<vs_TEXCOORD4.w;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb9 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
#ifdef UNITY_ADRENO_ES3
            u_xlatb9 = !!(u_xlat3.x==0.0);
#else
            u_xlatb9 = u_xlat3.x==0.0;
#endif
            u_xlatb12 = u_xlatb12 && u_xlatb9;
            if(!u_xlatb12){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
            u_xlat2.xy = _Metrics.xy * vec2(0.0, 2.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.yz;
        u_xlat9.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_12 = textureLod(_SearchTexture, u_xlat9.xy, 0.0).w;
        u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
        u_xlat0.z = (-_Metrics.y) * u_xlat12 + u_xlat3.y;
        u_xlat0.xw = _Metrics.ww * u_xlat0.xz + (-vs_TEXCOORD1.yy);
        u_xlat0.xw = roundEven(u_xlat0.xw);
        u_xlat0.xw = sqrt(abs(u_xlat0.xw));
        u_xlat4.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat0.yz;
        u_xlat1.y = textureLod(_ColorTexture, u_xlat4.xy, 0.0).y;
        u_xlat4.xy = u_xlat1.xy * vec2(4.0, 4.0);
        u_xlat4.xy = roundEven(u_xlat4.xy);
        u_xlat0.xy = u_xlat4.xy * vec2(16.0, 16.0) + u_xlat0.xw;
        u_xlat0.xy = u_xlat0.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_0.xy = textureLod(_AreaTexture, u_xlat0.xy, 0.0).xy;
        SV_Target0.zw = u_xlat10_0.xy;
    } else {
        SV_Target0.zw = vec2(0.0, 0.0);
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_HIGH" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec4 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * _Metrics.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
    u_xlat1 = _Metrics.xxyy * vec4(-0.25, 1.25, -0.125, -0.125) + u_xlat0.xxyy;
    u_xlat0 = _Metrics.xyxy * vec4(-0.125, -0.25, -0.125, 1.25) + u_xlat0.xyxy;
    vs_TEXCOORD2 = u_xlat1.xzyw;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.zw = u_xlat0.yw;
    vs_TEXCOORD4 = _Metrics.xxyy * vec4(-32.0, 32.0, -32.0, 32.0) + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _AreaTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _SearchTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat10_3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec2 u_xlat10_5;
vec3 u_xlat6;
mediump float u_xlat10_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat10_7;
bvec3 u_xlatb7;
vec3 u_xlat8;
vec2 u_xlat13;
mediump float u_xlat10_13;
bool u_xlatb13;
vec2 u_xlat14;
bool u_xlatb14;
mediump vec2 u_xlat10_15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat10_18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = texture(_ColorTexture, vs_TEXCOORD0.xy).xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<u_xlat0.y);
#else
    u_xlatb6 = 0.0<u_xlat0.y;
#endif
    if(u_xlatb6){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0.0<u_xlat0.x);
#else
        u_xlatb6 = 0.0<u_xlat0.x;
#endif
        if(u_xlatb6){
            u_xlat1.xy = _Metrics.xy * vec2(-1.0, 1.0);
            u_xlat1.z = 1.0;
            u_xlat2.xy = vs_TEXCOORD0.xy;
            u_xlat6.x = 0.0;
            u_xlat2.z = -1.0;
            u_xlat3.x = 1.0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb18 = !!(u_xlat2.z<7.0);
#else
                u_xlatb18 = u_xlat2.z<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(0.899999976<u_xlat3.x);
#else
                u_xlatb19 = 0.899999976<u_xlat3.x;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb19;
                if(!u_xlatb18){break;}
                u_xlat2.xyz = u_xlat1.xyz + u_xlat2.xyz;
                u_xlat6.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
                u_xlat3.x = dot(u_xlat6.yx, vec2(0.5, 0.5));
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb6 = !!(0.899999976<u_xlat6.x);
#else
            u_xlatb6 = 0.899999976<u_xlat6.x;
#endif
            u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
            u_xlat1.x = u_xlat6.x + u_xlat2.z;
        } else {
            u_xlat1.x = 0.0;
            u_xlat3.x = 0.0;
        }
        u_xlat6.xy = _Metrics.xy * vec2(1.0, -1.0);
        u_xlat6.z = 1.0;
        u_xlat2.yz = vs_TEXCOORD0.xy;
        u_xlat2.x = float(-1.0);
        u_xlat20 = float(1.0);
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb15 = !!(u_xlat2.x<7.0);
#else
            u_xlatb15 = u_xlat2.x<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.899999976<u_xlat20);
#else
            u_xlatb21 = 0.899999976<u_xlat20;
#endif
            u_xlatb15 = u_xlatb21 && u_xlatb15;
            if(!u_xlatb15){break;}
            u_xlat2.xyz = u_xlat6.zxy + u_xlat2.xyz;
            u_xlat10_15.xy = textureLod(_ColorTexture, u_xlat2.yz, 0.0).xy;
            u_xlat20 = dot(u_xlat10_15.xy, vec2(0.5, 0.5));
        }
        u_xlat3.y = u_xlat20;
        u_xlat6.x = u_xlat1.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(2.0<u_xlat6.x);
#else
        u_xlatb6 = 2.0<u_xlat6.x;
#endif
        if(u_xlatb6){
            u_xlat1.y = (-u_xlat1.x) + 0.25;
            u_xlat1.zw = u_xlat2.xx * vec2(1.0, -1.0) + vec2(0.0, -0.25);
            u_xlat2 = u_xlat1.yxzw * _Metrics.xyxy + vs_TEXCOORD0.xyxy;
            u_xlat2 = _Metrics.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat2;
            u_xlat6.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).xy;
            u_xlat10_7.xz = textureLod(_ColorTexture, u_xlat2.zw, 0.0).xy;
            u_xlat6.z = u_xlat10_7.x;
            u_xlat2.xy = u_xlat6.xz * vec2(5.0, 5.0) + vec2(-3.75, -3.75);
            u_xlat6.xz = u_xlat6.xz * abs(u_xlat2.xy);
            u_xlat6.xz = roundEven(u_xlat6.xz);
            u_xlat8.x = roundEven(u_xlat6.y);
            u_xlat8.z = roundEven(u_xlat10_7.z);
            u_xlat6.xy = u_xlat8.xz * vec2(2.0, 2.0) + u_xlat6.xz;
            u_xlatb7.xz = greaterThanEqual(u_xlat3.xxyy, vec4(0.899999976, 0.0, 0.899999976, 0.899999976)).xz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb7.x) ? float(0.0) : u_xlat6.x;
                hlslcc_movcTemp.y = (u_xlatb7.z) ? float(0.0) : u_xlat6.y;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat6.xy = u_xlat6.xy * vec2(20.0, 20.0) + u_xlat1.xz;
            u_xlat6.xy = u_xlat6.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.503125012, 0.000892857148);
            u_xlat6.xy = textureLod(_AreaTexture, u_xlat6.xy, 0.0).xy;
        } else {
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
        }
        u_xlat18 = _Metrics.x * 0.25 + vs_TEXCOORD0.x;
        u_xlat1.xy = (-_Metrics.xy);
        u_xlat1.z = 1.0;
        u_xlat8.x = u_xlat18;
        u_xlat8.y = vs_TEXCOORD0.y;
        u_xlat2.x = float(1.0);
        u_xlat8.z = float(-1.0);
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat8.z<7.0);
#else
            u_xlatb19 = u_xlat8.z<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb3.x = !!(0.899999976<u_xlat2.x);
#else
            u_xlatb3.x = 0.899999976<u_xlat2.x;
#endif
            u_xlatb19 = u_xlatb19 && u_xlatb3.x;
            if(!u_xlatb19){break;}
            u_xlat8.xyz = u_xlat1.xyz + u_xlat8.xyz;
            u_xlat10_3.xy = textureLod(_ColorTexture, u_xlat8.xy, 0.0).xy;
            u_xlat19 = u_xlat10_3.x * 5.0 + -3.75;
            u_xlat19 = abs(u_xlat19) * u_xlat10_3.x;
            u_xlat4.x = roundEven(u_xlat19);
            u_xlat4.y = roundEven(u_xlat10_3.y);
            u_xlat2.x = dot(u_xlat4.xy, vec2(0.5, 0.5));
        }
        u_xlat1.x = u_xlat8.z;
        u_xlat14.xy = _Metrics.xy * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
        u_xlat19 = textureLod(_ColorTexture, u_xlat14.xy, 0.0).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(0.0<u_xlat19);
#else
        u_xlatb19 = 0.0<u_xlat19;
#endif
        if(u_xlatb19){
            u_xlat3.xy = _Metrics.xy;
            u_xlat3.z = 1.0;
            u_xlat4.x = u_xlat18;
            u_xlat4.y = vs_TEXCOORD0.y;
            u_xlat4.z = -1.0;
            u_xlat2.y = float(1.0);
            u_xlat14.x = float(0.0);
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(u_xlat4.z<7.0);
#else
                u_xlatb19 = u_xlat4.z<7.0;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(0.899999976<u_xlat2.y);
#else
                u_xlatb21 = 0.899999976<u_xlat2.y;
#endif
                u_xlatb19 = u_xlatb19 && u_xlatb21;
                if(!u_xlatb19){break;}
                u_xlat4.xyz = u_xlat3.xyz + u_xlat4.xyz;
                u_xlat10_5.xy = textureLod(_ColorTexture, u_xlat4.xy, 0.0).xy;
                u_xlat19 = u_xlat10_5.x * 5.0 + -3.75;
                u_xlat19 = abs(u_xlat19) * u_xlat10_5.x;
                u_xlat14.y = roundEven(u_xlat19);
                u_xlat14.x = roundEven(u_xlat10_5.y);
                u_xlat2.y = dot(u_xlat14.yx, vec2(0.5, 0.5));
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.899999976<u_xlat14.x);
#else
            u_xlatb18 = 0.899999976<u_xlat14.x;
#endif
            u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
            u_xlat1.z = u_xlat18 + u_xlat4.z;
        } else {
            u_xlat1.z = 0.0;
            u_xlat2.y = 0.0;
        }
        u_xlat18 = u_xlat1.z + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(2.0<u_xlat18);
#else
        u_xlatb18 = 2.0<u_xlat18;
#endif
        if(u_xlatb18){
            u_xlat1.y = (-u_xlat1.x);
            u_xlat3 = u_xlat1.yyzz * _Metrics.xyxy + vs_TEXCOORD0.xyxy;
            u_xlat4 = _Metrics.xyxy * vec4(-1.0, 0.0, 0.0, -1.0) + u_xlat3.xyxy;
            u_xlat5.x = textureLod(_ColorTexture, u_xlat4.xy, 0.0).y;
            u_xlat5.z = textureLod(_ColorTexture, u_xlat4.zw, 0.0).x;
            u_xlat7.xz = _Metrics.xy * vec2(1.0, 0.0) + u_xlat3.zw;
            u_xlat5.yw = textureLod(_ColorTexture, u_xlat7.xz, 0.0).yx;
            u_xlat7.xz = u_xlat5.xy * vec2(2.0, 2.0) + u_xlat5.zw;
            u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, vec4(0.899999976, 0.899999976, 0.0, 0.0)).xy;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb2.x) ? float(0.0) : u_xlat7.x;
                hlslcc_movcTemp.z = (u_xlatb2.y) ? float(0.0) : u_xlat7.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat1.xy = u_xlat7.xz * vec2(20.0, 20.0) + u_xlat1.xz;
            u_xlat1.xy = u_xlat1.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.503125012, 0.000892857148);
            u_xlat10_1.xy = textureLod(_AreaTexture, u_xlat1.xy, 0.0).xy;
            u_xlat6.xy = u_xlat6.xy + u_xlat10_1.yx;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!((-u_xlat6.y)==u_xlat6.x);
#else
        u_xlatb18 = (-u_xlat6.y)==u_xlat6.x;
#endif
        if(u_xlatb18){
            u_xlat1.xy = vs_TEXCOORD2.xy;
            u_xlat1.z = 1.0;
            u_xlat2.x = 0.0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb18 = !!(vs_TEXCOORD4.x<u_xlat1.x);
#else
                u_xlatb18 = vs_TEXCOORD4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(0.828100026<u_xlat1.z);
#else
                u_xlatb19 = 0.828100026<u_xlat1.z;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb19;
#ifdef UNITY_ADRENO_ES3
                u_xlatb19 = !!(u_xlat2.x==0.0);
#else
                u_xlatb19 = u_xlat2.x==0.0;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb19;
                if(!u_xlatb18){break;}
                u_xlat2.xy = textureLod(_ColorTexture, u_xlat1.xy, 0.0).xy;
                u_xlat1.xy = _Metrics.xy * vec2(-2.0, -0.0) + u_xlat1.xy;
                u_xlat1.z = u_xlat2.y;
            }
            u_xlat2.yz = u_xlat1.xz;
            u_xlat1.xy = u_xlat2.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
            u_xlat10_18 = textureLod(_SearchTexture, u_xlat1.xy, 0.0).w;
            u_xlat18 = u_xlat10_18 * -2.00787401 + 3.25;
            u_xlat1.x = _Metrics.x * u_xlat18 + u_xlat2.y;
            u_xlat1.y = vs_TEXCOORD3.y;
            u_xlat2.x = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
            u_xlat3.xy = vs_TEXCOORD2.zw;
            u_xlat3.z = 1.0;
            u_xlat4.x = 0.0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb18 = !!(u_xlat3.x<vs_TEXCOORD4.y);
#else
                u_xlatb18 = u_xlat3.x<vs_TEXCOORD4.y;
#endif
#ifdef UNITY_ADRENO_ES3
                u_xlatb14 = !!(0.828100026<u_xlat3.z);
#else
                u_xlatb14 = 0.828100026<u_xlat3.z;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb14;
#ifdef UNITY_ADRENO_ES3
                u_xlatb14 = !!(u_xlat4.x==0.0);
#else
                u_xlatb14 = u_xlat4.x==0.0;
#endif
                u_xlatb18 = u_xlatb18 && u_xlatb14;
                if(!u_xlatb18){break;}
                u_xlat4.xy = textureLod(_ColorTexture, u_xlat3.xy, 0.0).xy;
                u_xlat3.xy = _Metrics.xy * vec2(2.0, 0.0) + u_xlat3.xy;
                u_xlat3.z = u_xlat4.y;
            }
            u_xlat4.yz = u_xlat3.xz;
            u_xlat14.xy = u_xlat4.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
            u_xlat10_18 = textureLod(_SearchTexture, u_xlat14.xy, 0.0).w;
            u_xlat18 = u_xlat10_18 * -2.00787401 + 3.25;
            u_xlat1.z = (-_Metrics.x) * u_xlat18 + u_xlat4.y;
            u_xlat3 = _Metrics.zzzz * u_xlat1.zxzx + (-vs_TEXCOORD1.xxxx);
            u_xlat3 = roundEven(u_xlat3);
            u_xlat14.xy = sqrt(abs(u_xlat3.wz));
            u_xlat4.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat1.zy;
            u_xlat2.y = textureLod(_ColorTexture, u_xlat4.xy, 0.0).x;
            u_xlat2.xy = u_xlat2.xy * vec2(4.0, 4.0);
            u_xlat2.xy = roundEven(u_xlat2.xy);
            u_xlat2.xy = u_xlat2.xy * vec2(16.0, 16.0) + u_xlat14.xy;
            u_xlat2.xy = u_xlat2.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
            u_xlat10_2.xy = textureLod(_AreaTexture, u_xlat2.xy, 0.0).xy;
            u_xlatb3 = greaterThanEqual(abs(u_xlat3), abs(u_xlat3.wzwz));
            u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
            u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
            u_xlat3.z = u_xlatb3.z ? float(0.75) : 0.0;
            u_xlat3.w = u_xlatb3.w ? float(0.75) : 0.0;
;
            u_xlat18 = u_xlat3.y + u_xlat3.x;
            u_xlat14.xy = u_xlat3.zw / vec2(u_xlat18);
            u_xlat1.w = vs_TEXCOORD0.y;
            u_xlat3.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat1.xw;
            u_xlat10_18 = textureLod(_ColorTexture, u_xlat3.xy, 0.0).x;
            u_xlat18 = (-u_xlat14.x) * u_xlat10_18 + 1.0;
            u_xlat3.xy = u_xlat1.zw + _Metrics.xy;
            u_xlat10_7.x = textureLod(_ColorTexture, u_xlat3.xy, 0.0).x;
            u_xlat3.x = (-u_xlat14.y) * u_xlat10_7.x + u_xlat18;
#ifdef UNITY_ADRENO_ES3
            u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
            u_xlat1 = _Metrics.xyxy * vec4(0.0, -2.0, 1.0, -2.0) + u_xlat1.xwzw;
            u_xlat10_18 = textureLod(_ColorTexture, u_xlat1.xy, 0.0).x;
            u_xlat18 = (-u_xlat14.x) * u_xlat10_18 + 1.0;
            u_xlat10_1.x = textureLod(_ColorTexture, u_xlat1.zw, 0.0).x;
            u_xlat3.y = (-u_xlat14.y) * u_xlat10_1.x + u_xlat18;
#ifdef UNITY_ADRENO_ES3
            u_xlat3.y = min(max(u_xlat3.y, 0.0), 1.0);
#else
            u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
#endif
            SV_Target0.xy = u_xlat10_2.xy * u_xlat3.xy;
        } else {
            SV_Target0.xy = u_xlat6.xy;
            u_xlat0.x = 0.0;
        }
    } else {
        SV_Target0.xy = vec2(0.0, 0.0);
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat0.x);
#else
    u_xlatb0 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD3.xy;
        u_xlat0.z = 1.0;
        u_xlat1.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(vs_TEXCOORD4.z<u_xlat0.y);
#else
            u_xlatb18 = vs_TEXCOORD4.z<u_xlat0.y;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(0.828100026<u_xlat0.z);
#else
            u_xlatb19 = 0.828100026<u_xlat0.z;
#endif
            u_xlatb18 = u_xlatb18 && u_xlatb19;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat1.x==0.0);
#else
            u_xlatb19 = u_xlat1.x==0.0;
#endif
            u_xlatb18 = u_xlatb18 && u_xlatb19;
            if(!u_xlatb18){break;}
            u_xlat1.xy = textureLod(_ColorTexture, u_xlat0.xy, 0.0).yx;
            u_xlat0.xy = _Metrics.xy * vec2(-0.0, -2.0) + u_xlat0.xy;
            u_xlat0.z = u_xlat1.y;
        }
        u_xlat1.yz = u_xlat0.yz;
        u_xlat0.xy = u_xlat1.xz * vec2(0.5, -2.0) + vec2(0.0078125, 2.03125);
        u_xlat10_0 = textureLod(_SearchTexture, u_xlat0.xy, 0.0).w;
        u_xlat0.x = u_xlat10_0 * -2.00787401 + 3.25;
        u_xlat0.x = _Metrics.y * u_xlat0.x + u_xlat1.y;
        u_xlat0.y = vs_TEXCOORD2.x;
        u_xlat1.x = textureLod(_ColorTexture, u_xlat0.yx, 0.0).y;
        u_xlat2.xy = vs_TEXCOORD3.zw;
        u_xlat2.z = 1.0;
        u_xlat3.x = 0.0;
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb13 = !!(u_xlat2.y<vs_TEXCOORD4.w);
#else
            u_xlatb13 = u_xlat2.y<vs_TEXCOORD4.w;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(0.828100026<u_xlat2.z);
#else
            u_xlatb19 = 0.828100026<u_xlat2.z;
#endif
            u_xlatb13 = u_xlatb19 && u_xlatb13;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat3.x==0.0);
#else
            u_xlatb19 = u_xlat3.x==0.0;
#endif
            u_xlatb13 = u_xlatb19 && u_xlatb13;
            if(!u_xlatb13){break;}
            u_xlat3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
            u_xlat2.xy = _Metrics.xy * vec2(0.0, 2.0) + u_xlat2.xy;
            u_xlat2.z = u_xlat3.y;
        }
        u_xlat3.yz = u_xlat2.yz;
        u_xlat13.xy = u_xlat3.xz * vec2(0.5, -2.0) + vec2(0.5234375, 2.03125);
        u_xlat10_13 = textureLod(_SearchTexture, u_xlat13.xy, 0.0).w;
        u_xlat13.x = u_xlat10_13 * -2.00787401 + 3.25;
        u_xlat0.z = (-_Metrics.y) * u_xlat13.x + u_xlat3.y;
        u_xlat2 = _Metrics.wwww * u_xlat0.zxzx + (-vs_TEXCOORD1.yyyy);
        u_xlat2 = roundEven(u_xlat2);
        u_xlat13.xy = sqrt(abs(u_xlat2.wz));
        u_xlat3.xy = _Metrics.xy * vec2(0.0, 1.0) + u_xlat0.yz;
        u_xlat1.y = textureLod(_ColorTexture, u_xlat3.xy, 0.0).y;
        u_xlat1.xy = u_xlat1.xy * vec2(4.0, 4.0);
        u_xlat1.xy = roundEven(u_xlat1.xy);
        u_xlat1.xy = u_xlat1.xy * vec2(16.0, 16.0) + u_xlat13.xy;
        u_xlat1.xy = u_xlat1.xy * vec2(0.00625000009, 0.0017857143) + vec2(0.00312500005, 0.000892857148);
        u_xlat10_1.xy = textureLod(_AreaTexture, u_xlat1.xy, 0.0).xy;
        u_xlatb2 = greaterThanEqual(abs(u_xlat2), abs(u_xlat2.wzwz));
        u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
        u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
        u_xlat2.z = u_xlatb2.z ? float(0.75) : 0.0;
        u_xlat2.w = u_xlatb2.w ? float(0.75) : 0.0;
;
        u_xlat6.x = u_xlat2.y + u_xlat2.x;
        u_xlat13.xy = u_xlat2.zw / u_xlat6.xx;
        u_xlat0.w = vs_TEXCOORD0.x;
        u_xlat2.xy = _Metrics.xy * vec2(1.0, 0.0) + u_xlat0.wx;
        u_xlat10_6 = textureLod(_ColorTexture, u_xlat2.xy, 0.0).y;
        u_xlat6.x = (-u_xlat13.x) * u_xlat10_6 + 1.0;
        u_xlat2.xy = u_xlat0.wz + _Metrics.xy;
        u_xlat10_2.x = textureLod(_ColorTexture, u_xlat2.xy, 0.0).y;
        u_xlat14.x = (-u_xlat13.y) * u_xlat10_2.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
        u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
        u_xlat0 = _Metrics.xyxy * vec4(-2.0, 0.0, -2.0, 1.0) + u_xlat0.wxwz;
        u_xlat10_0 = textureLod(_ColorTexture, u_xlat0.xy, 0.0).y;
        u_xlat0.x = (-u_xlat13.x) * u_xlat10_0 + 1.0;
        u_xlat10_6 = textureLod(_ColorTexture, u_xlat0.zw, 0.0).y;
        u_xlat14.y = (-u_xlat13.y) * u_xlat10_6 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat14.y = min(max(u_xlat14.y, 0.0), 1.0);
#else
        u_xlat14.y = clamp(u_xlat14.y, 0.0, 1.0);
#endif
        SV_Target0.zw = u_xlat10_1.xy * u_xlat14.xy;
    } else {
        SV_Target0.zw = vec2(0.0, 0.0);
    }
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 157665
Program "vp" {
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_LOW" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BlendTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_BlendTexture, vs_TEXCOORD1.xy).w;
    u_xlat0.y = texture(_BlendTexture, vs_TEXCOORD1.zw).y;
    u_xlat0.zw = texture(_BlendTexture, vs_TEXCOORD0.xy).zx;
    u_xlat1.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<9.99999975e-06);
#else
    u_xlatb1 = u_xlat1.x<9.99999975e-06;
#endif
    if(u_xlatb1){
        SV_Target0 = textureLod(_ColorTexture, vs_TEXCOORD0.xy, 0.0);
    } else {
        u_xlat1.xy = max(u_xlat0.zw, u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
#else
        u_xlatb1 = u_xlat1.y<u_xlat1.x;
#endif
        u_xlat2.xz = bool(u_xlatb1) ? u_xlat0.xz : vec2(0.0, 0.0);
        u_xlat2.yw = (bool(u_xlatb1)) ? vec2(0.0, 0.0) : u_xlat0.yw;
        u_xlat0.x = (u_xlatb1) ? u_xlat0.x : u_xlat0.y;
        u_xlat0.y = (u_xlatb1) ? u_xlat0.z : u_xlat0.w;
        u_xlat6 = dot(u_xlat0.xy, vec2(1.0, 1.0));
        u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
        u_xlat1 = _Metrics.xyxy * vec4(1.0, 1.0, -1.0, -1.0);
        u_xlat1 = u_xlat2 * u_xlat1 + vs_TEXCOORD0.xyxy;
        u_xlat10_2 = textureLod(_ColorTexture, u_xlat1.xy, 0.0);
        u_xlat10_1 = textureLod(_ColorTexture, u_xlat1.zw, 0.0);
        u_xlat1 = u_xlat0.yyyy * u_xlat10_1;
        SV_Target0 = u_xlat0.xxxx * u_xlat10_2 + u_xlat1;
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_MEDIUM" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BlendTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_BlendTexture, vs_TEXCOORD1.xy).w;
    u_xlat0.y = texture(_BlendTexture, vs_TEXCOORD1.zw).y;
    u_xlat0.zw = texture(_BlendTexture, vs_TEXCOORD0.xy).zx;
    u_xlat1.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<9.99999975e-06);
#else
    u_xlatb1 = u_xlat1.x<9.99999975e-06;
#endif
    if(u_xlatb1){
        SV_Target0 = textureLod(_ColorTexture, vs_TEXCOORD0.xy, 0.0);
    } else {
        u_xlat1.xy = max(u_xlat0.zw, u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
#else
        u_xlatb1 = u_xlat1.y<u_xlat1.x;
#endif
        u_xlat2.xz = bool(u_xlatb1) ? u_xlat0.xz : vec2(0.0, 0.0);
        u_xlat2.yw = (bool(u_xlatb1)) ? vec2(0.0, 0.0) : u_xlat0.yw;
        u_xlat0.x = (u_xlatb1) ? u_xlat0.x : u_xlat0.y;
        u_xlat0.y = (u_xlatb1) ? u_xlat0.z : u_xlat0.w;
        u_xlat6 = dot(u_xlat0.xy, vec2(1.0, 1.0));
        u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
        u_xlat1 = _Metrics.xyxy * vec4(1.0, 1.0, -1.0, -1.0);
        u_xlat1 = u_xlat2 * u_xlat1 + vs_TEXCOORD0.xyxy;
        u_xlat10_2 = textureLod(_ColorTexture, u_xlat1.xy, 0.0);
        u_xlat10_1 = textureLod(_ColorTexture, u_xlat1.zw, 0.0);
        u_xlat1 = u_xlat0.yyyy * u_xlat10_1;
        SV_Target0 = u_xlat0.xxxx * u_xlat10_2 + u_xlat1;
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_SMAA_PRESET_HIGH" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
uniform 	vec4 _Metrics;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BlendTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_BlendTexture, vs_TEXCOORD1.xy).w;
    u_xlat0.y = texture(_BlendTexture, vs_TEXCOORD1.zw).y;
    u_xlat0.zw = texture(_BlendTexture, vs_TEXCOORD0.xy).zx;
    u_xlat1.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<9.99999975e-06);
#else
    u_xlatb1 = u_xlat1.x<9.99999975e-06;
#endif
    if(u_xlatb1){
        SV_Target0 = textureLod(_ColorTexture, vs_TEXCOORD0.xy, 0.0);
    } else {
        u_xlat1.xy = max(u_xlat0.zw, u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
#else
        u_xlatb1 = u_xlat1.y<u_xlat1.x;
#endif
        u_xlat2.xz = bool(u_xlatb1) ? u_xlat0.xz : vec2(0.0, 0.0);
        u_xlat2.yw = (bool(u_xlatb1)) ? vec2(0.0, 0.0) : u_xlat0.yw;
        u_xlat0.x = (u_xlatb1) ? u_xlat0.x : u_xlat0.y;
        u_xlat0.y = (u_xlatb1) ? u_xlat0.z : u_xlat0.w;
        u_xlat6 = dot(u_xlat0.xy, vec2(1.0, 1.0));
        u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
        u_xlat1 = _Metrics.xyxy * vec4(1.0, 1.0, -1.0, -1.0);
        u_xlat1 = u_xlat2 * u_xlat1 + vs_TEXCOORD0.xyxy;
        u_xlat10_2 = textureLod(_ColorTexture, u_xlat1.xy, 0.0);
        u_xlat10_1 = textureLod(_ColorTexture, u_xlat1.zw, 0.0);
        u_xlat1 = u_xlat0.yyyy * u_xlat10_1;
        SV_Target0 = u_xlat0.xxxx * u_xlat10_2 + u_xlat1;
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_LOW" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.xyxy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BlendTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_BlendTexture, vs_TEXCOORD1.xy).w;
    u_xlat0.y = texture(_BlendTexture, vs_TEXCOORD1.zw).y;
    u_xlat0.zw = texture(_BlendTexture, vs_TEXCOORD0.xy).zx;
    u_xlat1.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<9.99999975e-06);
#else
    u_xlatb1 = u_xlat1.x<9.99999975e-06;
#endif
    if(u_xlatb1){
        SV_Target0 = textureLod(_ColorTexture, vs_TEXCOORD0.xy, 0.0);
    } else {
        u_xlat1.xy = max(u_xlat0.zw, u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
#else
        u_xlatb1 = u_xlat1.y<u_xlat1.x;
#endif
        u_xlat2.xz = bool(u_xlatb1) ? u_xlat0.xz : vec2(0.0, 0.0);
        u_xlat2.yw = (bool(u_xlatb1)) ? vec2(0.0, 0.0) : u_xlat0.yw;
        u_xlat0.x = (u_xlatb1) ? u_xlat0.x : u_xlat0.y;
        u_xlat0.y = (u_xlatb1) ? u_xlat0.z : u_xlat0.w;
        u_xlat6 = dot(u_xlat0.xy, vec2(1.0, 1.0));
        u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
        u_xlat1 = _Metrics.xyxy * vec4(1.0, 1.0, -1.0, -1.0);
        u_xlat1 = u_xlat2 * u_xlat1 + vs_TEXCOORD0.xyxy;
        u_xlat10_2 = textureLod(_ColorTexture, u_xlat1.xy, 0.0);
        u_xlat10_1 = textureLod(_ColorTexture, u_xlat1.zw, 0.0);
        u_xlat1 = u_xlat0.yyyy * u_xlat10_1;
        SV_Target0 = u_xlat0.xxxx * u_xlat10_2 + u_xlat1;
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_MEDIUM" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.xyxy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BlendTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_BlendTexture, vs_TEXCOORD1.xy).w;
    u_xlat0.y = texture(_BlendTexture, vs_TEXCOORD1.zw).y;
    u_xlat0.zw = texture(_BlendTexture, vs_TEXCOORD0.xy).zx;
    u_xlat1.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<9.99999975e-06);
#else
    u_xlatb1 = u_xlat1.x<9.99999975e-06;
#endif
    if(u_xlatb1){
        SV_Target0 = textureLod(_ColorTexture, vs_TEXCOORD0.xy, 0.0);
    } else {
        u_xlat1.xy = max(u_xlat0.zw, u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
#else
        u_xlatb1 = u_xlat1.y<u_xlat1.x;
#endif
        u_xlat2.xz = bool(u_xlatb1) ? u_xlat0.xz : vec2(0.0, 0.0);
        u_xlat2.yw = (bool(u_xlatb1)) ? vec2(0.0, 0.0) : u_xlat0.yw;
        u_xlat0.x = (u_xlatb1) ? u_xlat0.x : u_xlat0.y;
        u_xlat0.y = (u_xlatb1) ? u_xlat0.z : u_xlat0.w;
        u_xlat6 = dot(u_xlat0.xy, vec2(1.0, 1.0));
        u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
        u_xlat1 = _Metrics.xyxy * vec4(1.0, 1.0, -1.0, -1.0);
        u_xlat1 = u_xlat2 * u_xlat1 + vs_TEXCOORD0.xyxy;
        u_xlat10_2 = textureLod(_ColorTexture, u_xlat1.xy, 0.0);
        u_xlat10_1 = textureLod(_ColorTexture, u_xlat1.zw, 0.0);
        u_xlat1 = u_xlat0.yyyy * u_xlat10_1;
        SV_Target0 = u_xlat0.xxxx * u_xlat10_2 + u_xlat1;
    }
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_SMAA_PRESET_HIGH" }
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
uniform 	vec4 _ScaleBias;
uniform 	vec4 _Metrics;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
uint u_xlatu4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    u_xlat0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati4 = u_xlati4 + 1;
    u_xlatu4 = uint(uint(u_xlati4) & 1u);
    u_xlat1.y = float(u_xlatu4);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _Metrics.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.xyxy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Metrics;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BlendTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_BlendTexture, vs_TEXCOORD1.xy).w;
    u_xlat0.y = texture(_BlendTexture, vs_TEXCOORD1.zw).y;
    u_xlat0.zw = texture(_BlendTexture, vs_TEXCOORD0.xy).zx;
    u_xlat1.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<9.99999975e-06);
#else
    u_xlatb1 = u_xlat1.x<9.99999975e-06;
#endif
    if(u_xlatb1){
        SV_Target0 = textureLod(_ColorTexture, vs_TEXCOORD0.xy, 0.0);
    } else {
        u_xlat1.xy = max(u_xlat0.zw, u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
#else
        u_xlatb1 = u_xlat1.y<u_xlat1.x;
#endif
        u_xlat2.xz = bool(u_xlatb1) ? u_xlat0.xz : vec2(0.0, 0.0);
        u_xlat2.yw = (bool(u_xlatb1)) ? vec2(0.0, 0.0) : u_xlat0.yw;
        u_xlat0.x = (u_xlatb1) ? u_xlat0.x : u_xlat0.y;
        u_xlat0.y = (u_xlatb1) ? u_xlat0.z : u_xlat0.w;
        u_xlat6 = dot(u_xlat0.xy, vec2(1.0, 1.0));
        u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
        u_xlat1 = _Metrics.xyxy * vec4(1.0, 1.0, -1.0, -1.0);
        u_xlat1 = u_xlat2 * u_xlat1 + vs_TEXCOORD0.xyxy;
        u_xlat10_2 = textureLod(_ColorTexture, u_xlat1.xy, 0.0);
        u_xlat10_1 = textureLod(_ColorTexture, u_xlat1.zw, 0.0);
        u_xlat1 = u_xlat0.yyyy * u_xlat10_1;
        SV_Target0 = u_xlat0.xxxx * u_xlat10_2 + u_xlat1;
    }
    return;
}

#endif
"
}
}
}
}
}