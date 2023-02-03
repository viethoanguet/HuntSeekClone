//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/LutBuilderHdr" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "LutBuilderHdr"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 50215
Program "vp" {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	vec4 _ColorFilter;
uniform 	vec4 _ChannelMixerRed;
uniform 	vec4 _ChannelMixerGreen;
uniform 	vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	vec4 _SplitShadows;
uniform 	vec4 _SplitHighlights;
UNITY_LOCATION(0) uniform mediump sampler2D _CurveMaster;
UNITY_LOCATION(1) uniform mediump sampler2D _CurveRed;
UNITY_LOCATION(2) uniform mediump sampler2D _CurveGreen;
UNITY_LOCATION(3) uniform mediump sampler2D _CurveBlue;
UNITY_LOCATION(4) uniform mediump sampler2D _CurveHueVsHue;
UNITY_LOCATION(5) uniform mediump sampler2D _CurveHueVsSat;
UNITY_LOCATION(6) uniform mediump sampler2D _CurveSatVsSat;
UNITY_LOCATION(7) uniform mediump sampler2D _CurveLumVsSat;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat10_4;
ivec3 u_xlati4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
mediump float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
mediump float u_xlat16_21;
vec2 u_xlat22;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat16_2.xyz = u_xlat0.xzw * _Lut_Params.www + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_3.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat16_3.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat16_3.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat16_3.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat5.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_2.x = dot(u_xlat5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat27 = u_xlat16_2.x + _SplitShadows.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat5.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat6.xyz = (-u_xlat5.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat1.xyz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlatb6.xyz = greaterThanEqual(u_xlat5.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat7.x = (u_xlatb6.x) ? float(0.0) : float(1.0);
    u_xlat7.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat7.z = (u_xlatb6.z) ? float(0.0) : float(1.0);
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
    u_xlat6.z = u_xlatb6.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat5.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat6.xyz = (-u_xlat5.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat1.xyz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlatb6.xyz = greaterThanEqual(u_xlat5.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat7.x = (u_xlatb6.x) ? float(0.0) : float(1.0);
    u_xlat7.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat7.z = (u_xlatb6.z) ? float(0.0) : float(1.0);
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
    u_xlat6.z = u_xlatb6.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat4.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat22.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat22.xy = vec2(1.0, 1.0) / u_xlat22.xy;
    u_xlat4.xy = u_xlat22.xy * u_xlat4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat22.xy = u_xlat4.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat27 = (-u_xlat22.x) * u_xlat4.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat22.y) * u_xlat4.y + u_xlat28;
    u_xlat4.x = u_xlat4.y * u_xlat22.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat13.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat13.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat4.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * 0xFFFFFFFFu);
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati4.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat4.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat4.y>=u_xlat4.z);
#else
    u_xlatb27 = u_xlat4.y>=u_xlat4.z;
#endif
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_3.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat4.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_3.xyw);
    u_xlat16_2.yzw = u_xlat16_3.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat4.x>=u_xlat16_3.x);
#else
    u_xlatb0 = u_xlat4.x>=u_xlat16_3.x;
#endif
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_21 * u_xlat16_2.w + u_xlat4.x;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + u_xlat16_3.xyw;
    u_xlat16_3.x = dot(u_xlat4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_21 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_21);
    u_xlat16_21 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_21;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat10.x = u_xlat10_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x + u_xlat10.x;
    u_xlat1.x = u_xlat1.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(1.0<u_xlat1.x);
#else
    u_xlatb10 = 1.0<u_xlat1.x;
#endif
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<0.0);
#else
    u_xlatb1 = u_xlat1.x<0.0;
#endif
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_21 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_21));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_4 = texture(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat4.x = u_xlat10_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat10_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat28 = dot(u_xlat4.xx, vec2(u_xlat28));
    u_xlat16_3.y = 0.0;
    u_xlat10_4 = texture(_CurveLumVsSat, u_xlat16_3.xy).x;
    u_xlat4.x = u_xlat10_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat28 * u_xlat4.x;
    u_xlat28 = dot(_HueSatCon.yy, vec2(u_xlat28));
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat1.xyz + vec3(u_xlat16_21);
    u_xlat16_2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat16_2.x = max(u_xlat1.z, u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = float(1.0) / float(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_2.xxx + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveMaster, u_xlat0.xw).x;
    u_xlat1.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat10.x = texture(_CurveMaster, u_xlat0.yw).x;
    u_xlat10.y = texture(_CurveMaster, u_xlat0.zw).x;
    u_xlat1.yz = u_xlat10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.yz = min(max(u_xlat1.yz, 0.0), 1.0);
#else
    u_xlat1.yz = clamp(u_xlat1.yz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveRed, u_xlat0.xw).x;
    u_xlat1.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat10.x = texture(_CurveGreen, u_xlat0.yw).x;
    u_xlat10.y = texture(_CurveBlue, u_xlat0.zw).x;
    u_xlat1.yz = u_xlat10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.yz = min(max(u_xlat1.yz, 0.0), 1.0);
#else
    u_xlat1.yz = clamp(u_xlat1.yz, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat16_2.x = max(u_xlat1.z, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = float(1.0) / float(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_TONEMAP_ACES" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	vec4 _ColorFilter;
uniform 	vec4 _ChannelMixerRed;
uniform 	vec4 _ChannelMixerGreen;
uniform 	vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	vec4 _SplitShadows;
uniform 	vec4 _SplitHighlights;
UNITY_LOCATION(0) uniform mediump sampler2D _CurveMaster;
UNITY_LOCATION(1) uniform mediump sampler2D _CurveRed;
UNITY_LOCATION(2) uniform mediump sampler2D _CurveGreen;
UNITY_LOCATION(3) uniform mediump sampler2D _CurveBlue;
UNITY_LOCATION(4) uniform mediump sampler2D _CurveHueVsHue;
UNITY_LOCATION(5) uniform mediump sampler2D _CurveHueVsSat;
UNITY_LOCATION(6) uniform mediump sampler2D _CurveSatVsSat;
UNITY_LOCATION(7) uniform mediump sampler2D _CurveLumVsSat;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat10_1;
ivec3 u_xlati1;
bvec4 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat10_5;
ivec3 u_xlati5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
vec3 u_xlat10;
mediump float u_xlat10_10;
bvec2 u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat14;
mediump vec2 u_xlat16_18;
float u_xlat19;
bvec2 u_xlatb19;
mediump float u_xlat16_20;
mediump float u_xlat16_21;
vec2 u_xlat23;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat10_28;
bool u_xlatb28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat16_2.xyz = u_xlat0.xzw * _Lut_Params.www + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_3.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat16_3.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat16_3.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat16_3.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_3.x = dot(vec3(0.439700991, 0.382977992, 0.177334994), u_xlat16_2.xyz);
    u_xlat16_3.y = dot(vec3(0.0897922963, 0.813422978, 0.0967615992), u_xlat16_2.xyz);
    u_xlat16_3.z = dot(vec3(0.0175439995, 0.111543998, 0.870703995), u_xlat16_2.xyz);
    u_xlat16_2.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + vec3(1.525878e-05, 1.525878e-05, 1.525878e-05);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    u_xlat16_4.xyz = log2(u_xlat16_2.xyz);
    u_xlatb0.xyz = lessThan(u_xlat16_2.xyzx, vec4(3.05175708e-05, 3.05175708e-05, 3.05175708e-05, 0.0)).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    {
        vec4 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat0.xyz = u_xlat16_2.xyz + vec3(-0.413588405, -0.413588405, -0.413588405);
    u_xlat0.xyz = u_xlat0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlatb1 = lessThan(u_xlat0.xxyy, vec4(-0.301369876, 1.46799636, -0.301369876, 1.46799636));
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(17.5200005, 17.5200005, 17.5200005) + vec3(-9.72000027, -9.72000027, -9.72000027);
    u_xlatb0.xy = lessThan(u_xlat0.zzzz, vec4(-0.301369876, 1.46799636, 0.0, 0.0)).xy;
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_3.x = (u_xlatb1.y) ? u_xlat16_2.x : float(65504.0);
    u_xlat16_3.y = (u_xlatb1.w) ? u_xlat16_2.y : float(65504.0);
    u_xlat16_2.xyw = u_xlat16_2.xyz + vec3(-1.52587891e-05, -1.52587891e-05, -1.52587891e-05);
    u_xlat16_20 = (u_xlatb0.y) ? u_xlat16_2.z : 65504.0;
    u_xlat16_2.xyw = u_xlat16_2.xyw + u_xlat16_2.xyw;
    {
        vec4 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb1.z) ? u_xlat16_2.y : u_xlat16_3.y;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat16_3.z = (u_xlatb0.x) ? u_xlat16_2.w : u_xlat16_20;
    u_xlat0.x = dot(vec3(1.45143926, -0.236510754, -0.214928567), u_xlat16_3.xyz);
    u_xlat0.y = dot(vec3(-0.0765537769, 1.17622972, -0.0996759236), u_xlat16_3.xyz);
    u_xlat0.z = dot(vec3(0.00831614807, -0.00603244966, 0.997716308), u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * _ColorFilter.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat6.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_2.x = dot(u_xlat6.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat27 = u_xlat16_2.x + _SplitShadows.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat6.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat7.xyz = (-u_xlat6.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlatb7.xyz = greaterThanEqual(u_xlat6.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat8.x = (u_xlatb7.x) ? float(0.0) : float(1.0);
    u_xlat8.y = (u_xlatb7.y) ? float(0.0) : float(1.0);
    u_xlat8.z = (u_xlatb7.z) ? float(0.0) : float(1.0);
    u_xlat7.x = u_xlatb7.x ? float(1.0) : 0.0;
    u_xlat7.y = u_xlatb7.y ? float(1.0) : 0.0;
    u_xlat7.z = u_xlatb7.z ? float(1.0) : 0.0;
;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat8.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat8.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat6.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat7.xyz = (-u_xlat6.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlatb7.xyz = greaterThanEqual(u_xlat6.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat8.x = (u_xlatb7.x) ? float(0.0) : float(1.0);
    u_xlat8.y = (u_xlatb7.y) ? float(0.0) : float(1.0);
    u_xlat8.z = (u_xlatb7.z) ? float(0.0) : float(1.0);
    u_xlat7.x = u_xlatb7.x ? float(1.0) : 0.0;
    u_xlat7.y = u_xlatb7.y ? float(1.0) : 0.0;
    u_xlat7.z = u_xlatb7.z ? float(1.0) : 0.0;
;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat8.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat8.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz + u_xlat5.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat5.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat23.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat23.xy = vec2(1.0, 1.0) / u_xlat23.xy;
    u_xlat5.xy = u_xlat23.xy * u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat23.xy = u_xlat5.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat5.xy = u_xlat5.xy * u_xlat5.xy;
    u_xlat27 = (-u_xlat23.x) * u_xlat5.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat23.y) * u_xlat5.y + u_xlat28;
    u_xlat5.x = u_xlat5.y * u_xlat23.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat14.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat14.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * 0xFFFFFFFFu);
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati5.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat5.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat5.y>=u_xlat5.z);
#else
    u_xlatb27 = u_xlat5.y>=u_xlat5.z;
#endif
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_3.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_4.w = (-u_xlat5.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_2.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat5.x>=u_xlat16_3.x);
#else
    u_xlatb0.x = u_xlat5.x>=u_xlat16_3.x;
#endif
    u_xlat16_21 = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_21 * u_xlat16_2.w + u_xlat5.x;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + u_xlat16_3.xyw;
    u_xlat16_3.x = dot(u_xlat5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_21 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_21);
    u_xlat16_21 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_21;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat10.x = u_xlat10_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x + u_xlat10.x;
    u_xlat1.x = u_xlat1.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(1.0<u_xlat1.x);
#else
    u_xlatb10.x = 1.0<u_xlat1.x;
#endif
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10.x) ? u_xlat16_11.y : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    u_xlat16_11.x = (u_xlatb1.x) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_4.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_4.xyz = fract(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_4.xyz = abs(u_xlat16_4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_21 = dot(u_xlat16_4.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_21));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_5 = texture(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat5.x = u_xlat10_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat10_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat28 = dot(u_xlat5.xx, vec2(u_xlat28));
    u_xlat16_3.y = 0.0;
    u_xlat10_5 = texture(_CurveLumVsSat, u_xlat16_3.xy).x;
    u_xlat5.x = u_xlat10_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat28 * u_xlat5.x;
    u_xlat28 = dot(_HueSatCon.yy, vec2(u_xlat28));
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat1.xyz + vec3(u_xlat16_21);
    u_xlat16_2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat16_2.x = max(u_xlat1.z, u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = float(1.0) / float(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_2.xxx + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveMaster, u_xlat0.xw).x;
    u_xlat1.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat10.x = texture(_CurveMaster, u_xlat0.yw).x;
    u_xlat10.y = texture(_CurveMaster, u_xlat0.zw).x;
    u_xlat1.yz = u_xlat10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.yz = min(max(u_xlat1.yz, 0.0), 1.0);
#else
    u_xlat1.yz = clamp(u_xlat1.yz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveRed, u_xlat0.xw).x;
    u_xlat1.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat10.x = texture(_CurveGreen, u_xlat0.yw).x;
    u_xlat10.y = texture(_CurveBlue, u_xlat0.zw).x;
    u_xlat1.yz = u_xlat10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.yz = min(max(u_xlat1.yz, 0.0), 1.0);
#else
    u_xlat1.yz = clamp(u_xlat1.yz, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat16_2.x = max(u_xlat1.z, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = float(1.0) / float(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat14.x = dot(vec3(0.695452213, 0.140678704, 0.163869068), u_xlat1.xyz);
    u_xlat14.y = dot(vec3(0.0447945632, 0.859671116, 0.0955343172), u_xlat1.xyz);
    u_xlat14.z = dot(vec3(-0.00552588282, 0.00402521016, 1.00150073), u_xlat1.xyz);
    u_xlat16_2.xyz = (-u_xlat14.yxz) + u_xlat14.zyx;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat14.zy;
    u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat14.x * u_xlat16_2.z + u_xlat16_2.x;
    u_xlat1.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.x = sqrt(u_xlat1.x);
    u_xlat16_11.x = u_xlat14.y + u_xlat14.z;
    u_xlat16_11.x = u_xlat14.x + u_xlat16_11.x;
    u_xlat16_2.x = u_xlat16_2.x * 1.75 + u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_2.x * 0.333333343;
    u_xlat16_11.x = 0.0799999982 / u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x + -0.5;
    u_xlat16_20 = min(u_xlat14.y, u_xlat14.x);
    u_xlat16_20 = min(u_xlat14.z, u_xlat16_20);
    u_xlat16_20 = max(u_xlat16_20, 9.99999975e-05);
    u_xlat16_29 = max(u_xlat14.y, u_xlat14.x);
    u_xlat16_29 = max(u_xlat14.z, u_xlat16_29);
    u_xlat16_3.xy = max(vec2(u_xlat16_29), vec2(9.99999975e-05, 0.00999999978));
    u_xlat16_20 = (-u_xlat16_20) + u_xlat16_3.x;
    u_xlat16_20 = u_xlat16_20 / u_xlat16_3.y;
    u_xlat1.x = u_xlat16_20 + -0.400000006;
    u_xlat16_29 = u_xlat1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1.x = u_xlat1.x>=0.0;
#endif
    u_xlat1.x = (u_xlatb1.x) ? 1.0 : -1.0;
    u_xlat16_29 = -abs(u_xlat16_29) + 1.0;
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_29 = (-u_xlat16_29) * u_xlat16_29 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_29 + 1.0;
    u_xlat1.x = u_xlat1.x * 0.0250000004;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_2.x>=0.479999989);
#else
    u_xlatb10.x = u_xlat16_2.x>=0.479999989;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19.x = !!(0.159999996>=u_xlat16_2.x);
#else
    u_xlatb19.x = 0.159999996>=u_xlat16_2.x;
#endif
    u_xlat16_2.x = (u_xlatb10.x) ? 0.0 : u_xlat16_11.x;
    u_xlat16_2.x = (u_xlatb19.x) ? u_xlat1.x : u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat0.yzw = u_xlat16_2.xxx * u_xlat14.xyz;
    u_xlat1.x = (-u_xlat14.x) * u_xlat16_2.x + 0.0299999993;
    u_xlat16_11.x = u_xlat14.y * u_xlat16_2.x + (-u_xlat0.w);
    u_xlat16_11.x = u_xlat16_11.x * 1.73205078;
    u_xlat16_29 = u_xlat0.y * 2.0 + (-u_xlat0.z);
    u_xlat16_2.x = (-u_xlat14.z) * u_xlat16_2.x + u_xlat16_29;
    u_xlat16_29 = max(abs(u_xlat16_2.x), abs(u_xlat16_11.x));
    u_xlat16_29 = float(1.0) / u_xlat16_29;
    u_xlat16_3.x = min(abs(u_xlat16_2.x), abs(u_xlat16_11.x));
    u_xlat16_29 = u_xlat16_29 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_29 * u_xlat16_29;
    u_xlat10.x = u_xlat16_3.x * 0.0208350997 + -0.0851330012;
    u_xlat10.x = u_xlat16_3.x * u_xlat10.x + 0.180141002;
    u_xlat10.x = u_xlat16_3.x * u_xlat10.x + -0.330299497;
    u_xlat10.x = u_xlat16_3.x * u_xlat10.x + 0.999866009;
    u_xlat19 = u_xlat10.x * u_xlat16_29;
    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(abs(u_xlat16_2.x)<abs(u_xlat16_11.x));
#else
    u_xlatb28 = abs(u_xlat16_2.x)<abs(u_xlat16_11.x);
#endif
    u_xlat19 = u_xlatb28 ? u_xlat19 : float(0.0);
    u_xlat10.x = u_xlat16_29 * u_xlat10.x + u_xlat19;
    u_xlat16_2.w = min(u_xlat16_2.x, u_xlat16_11.x);
    u_xlat16_11.x = max(u_xlat16_2.x, u_xlat16_11.x);
    u_xlatb19.xy = lessThan(u_xlat16_2.xwxw, (-u_xlat16_2.xwxw)).xy;
    u_xlat19 = u_xlatb19.x ? -3.14159274 : float(0.0);
    u_xlat10.x = u_xlat19 + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19.x = !!(u_xlat16_11.x>=(-u_xlat16_11.x));
#else
    u_xlatb19.x = u_xlat16_11.x>=(-u_xlat16_11.x);
#endif
    u_xlatb19.x = u_xlatb19.x && u_xlatb19.y;
    u_xlat10.x = (u_xlatb19.x) ? (-u_xlat10.x) : u_xlat10.x;
    u_xlat16_2.x = u_xlat10.x * 57.2957802;
    u_xlatb10.xy = equal(u_xlat0.zwzz, u_xlat0.yzyy).xy;
    u_xlatb10.x = u_xlatb10.y && u_xlatb10.x;
    u_xlat16_2.x = (u_xlatb10.x) ? 0.0 : u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb10.x = u_xlat16_2.x<0.0;
#endif
    u_xlat16_11.x = u_xlat16_2.x + 360.0;
    u_xlat16_2.x = (u_xlatb10.x) ? u_xlat16_11.x : u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(180.0<u_xlat16_2.x);
#else
    u_xlatb10.x = 180.0<u_xlat16_2.x;
#endif
    u_xlat16_11.xz = u_xlat16_2.xx + vec2(360.0, -360.0);
    u_xlat16_29 = (u_xlatb10.x) ? u_xlat16_11.z : u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_2.x<-180.0);
#else
    u_xlatb10.x = u_xlat16_2.x<-180.0;
#endif
    u_xlat16_2.x = (u_xlatb10.x) ? u_xlat16_11.x : u_xlat16_29;
    u_xlat10.x = u_xlat16_2.x * 0.0148148146;
    u_xlat10.x = -abs(u_xlat10.x) + 1.0;
    u_xlat10.x = max(u_xlat10.x, 0.0);
    u_xlat19 = u_xlat10.x * -2.0 + 3.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat10.x * u_xlat19;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat16_20 * u_xlat10.x;
    u_xlat1.x = u_xlat1.x * u_xlat10.x;
    u_xlat0.x = u_xlat1.x * 0.180000007 + u_xlat0.y;
    u_xlat1.x = dot(vec3(1.45143926, -0.236510754, -0.214928567), u_xlat0.xzw);
    u_xlat1.y = dot(vec3(-0.0765537769, 1.17622972, -0.0996759236), u_xlat0.xzw);
    u_xlat1.z = dot(vec3(0.00831614807, -0.00603244966, 0.997716308), u_xlat0.xzw);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat28 = dot(u_xlat1.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat1.xyz = (-vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.959999979, 0.959999979, 0.959999979) + vec3(u_xlat28);
    u_xlat5.xyz = u_xlat1.xyz * vec3(2.78508496, 2.78508496, 2.78508496) + vec3(0.107772, 0.107772, 0.107772);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(2.93604493, 2.93604493, 2.93604493) + vec3(0.887121975, 0.887121975, 0.887121975);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.806888998, 0.806888998, 0.806888998);
    u_xlat1.xyz = u_xlat5.xyz / u_xlat1.xyz;
    u_xlat5.z = dot(vec3(-0.00557464967, 0.0040607336, 1.01033914), u_xlat1.xyz);
    u_xlat5.x = dot(vec3(0.662454188, 0.134004205, 0.156187683), u_xlat1.xyz);
    u_xlat5.y = dot(vec3(0.272228718, 0.674081743, 0.0536895171), u_xlat1.xyz);
    u_xlat16_2.x = dot(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat16_2.xy = u_xlat5.xy / u_xlat16_2.xx;
    u_xlat16_29 = max(u_xlat5.y, 0.0);
    u_xlat16_29 = min(u_xlat16_29, 65504.0);
    u_xlat16_29 = log2(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 0.981100023;
    u_xlat16_3.y = exp2(u_xlat16_29);
    u_xlat16_29 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.z = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_11.x = max(u_xlat16_2.y, 9.99999975e-05);
    u_xlat16_11.x = u_xlat16_3.y / u_xlat16_11.x;
    u_xlat16_3.xz = u_xlat16_11.xx * u_xlat16_2.xz;
    u_xlat16_2.x = dot(vec3(1.6410234, -0.324803293, -0.236424699), u_xlat16_3.xyz);
    u_xlat16_2.y = dot(vec3(-0.663662851, 1.61533165, 0.0167563483), u_xlat16_3.xyz);
    u_xlat16_2.z = dot(vec3(0.0117218941, -0.00828444213, 0.988394856), u_xlat16_3.xyz);
    u_xlat1.x = dot(u_xlat16_2.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat10.xyz = (-u_xlat1.xxx) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat10.xyz * vec3(0.930000007, 0.930000007, 0.930000007) + u_xlat1.xxx;
    u_xlat5.x = dot(vec3(0.662454188, 0.134004205, 0.156187683), u_xlat1.xyz);
    u_xlat5.y = dot(vec3(0.272228718, 0.674081743, 0.0536895171), u_xlat1.xyz);
    u_xlat5.z = dot(vec3(-0.00557464967, 0.0040607336, 1.01033914), u_xlat1.xyz);
    u_xlat1.x = dot(vec3(0.987223983, -0.00611326983, 0.0159533005), u_xlat5.xyz);
    u_xlat1.y = dot(vec3(-0.00759836007, 1.00186002, 0.00533019984), u_xlat5.xyz);
    u_xlat1.z = dot(vec3(0.00307257008, -0.00509594986, 1.08168006), u_xlat5.xyz);
    SV_Target0.x = dot(vec3(3.2409699, -1.5373832, -0.498610765), u_xlat1.xyz);
    SV_Target0.y = dot(vec3(-0.969243646, 1.8759675, 0.0415550582), u_xlat1.xyz);
    SV_Target0.z = dot(vec3(0.0556300804, -0.203976959, 1.05697155), u_xlat1.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_TONEMAP_NEUTRAL" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	vec4 _ColorFilter;
uniform 	vec4 _ChannelMixerRed;
uniform 	vec4 _ChannelMixerGreen;
uniform 	vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	vec4 _SplitShadows;
uniform 	vec4 _SplitHighlights;
UNITY_LOCATION(0) uniform mediump sampler2D _CurveMaster;
UNITY_LOCATION(1) uniform mediump sampler2D _CurveRed;
UNITY_LOCATION(2) uniform mediump sampler2D _CurveGreen;
UNITY_LOCATION(3) uniform mediump sampler2D _CurveBlue;
UNITY_LOCATION(4) uniform mediump sampler2D _CurveHueVsHue;
UNITY_LOCATION(5) uniform mediump sampler2D _CurveHueVsSat;
UNITY_LOCATION(6) uniform mediump sampler2D _CurveSatVsSat;
UNITY_LOCATION(7) uniform mediump sampler2D _CurveLumVsSat;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat10_4;
ivec3 u_xlati4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
mediump float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
mediump float u_xlat16_21;
vec2 u_xlat22;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat16_2.xyz = u_xlat0.xzw * _Lut_Params.www + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_3.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat16_3.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat16_3.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat16_3.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat5.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_2.x = dot(u_xlat5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat27 = u_xlat16_2.x + _SplitShadows.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat5.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat6.xyz = (-u_xlat5.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat1.xyz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlatb6.xyz = greaterThanEqual(u_xlat5.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat7.x = (u_xlatb6.x) ? float(0.0) : float(1.0);
    u_xlat7.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat7.z = (u_xlatb6.z) ? float(0.0) : float(1.0);
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
    u_xlat6.z = u_xlatb6.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat5.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat6.xyz = (-u_xlat5.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat1.xyz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlatb6.xyz = greaterThanEqual(u_xlat5.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat7.x = (u_xlatb6.x) ? float(0.0) : float(1.0);
    u_xlat7.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat7.z = (u_xlatb6.z) ? float(0.0) : float(1.0);
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
    u_xlat6.z = u_xlatb6.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat4.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat22.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat22.xy = vec2(1.0, 1.0) / u_xlat22.xy;
    u_xlat4.xy = u_xlat22.xy * u_xlat4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat22.xy = u_xlat4.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat27 = (-u_xlat22.x) * u_xlat4.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat22.y) * u_xlat4.y + u_xlat28;
    u_xlat4.x = u_xlat4.y * u_xlat22.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat13.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat13.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat4.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * 0xFFFFFFFFu);
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati4.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat4.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat4.y>=u_xlat4.z);
#else
    u_xlatb27 = u_xlat4.y>=u_xlat4.z;
#endif
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_3.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat4.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_3.xyw);
    u_xlat16_2.yzw = u_xlat16_3.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat4.x>=u_xlat16_3.x);
#else
    u_xlatb0 = u_xlat4.x>=u_xlat16_3.x;
#endif
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_21 * u_xlat16_2.w + u_xlat4.x;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + u_xlat16_3.xyw;
    u_xlat16_3.x = dot(u_xlat4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_21 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_21);
    u_xlat16_21 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_21;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat10.x = u_xlat10_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x + u_xlat10.x;
    u_xlat1.x = u_xlat1.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(1.0<u_xlat1.x);
#else
    u_xlatb10 = 1.0<u_xlat1.x;
#endif
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<0.0);
#else
    u_xlatb1 = u_xlat1.x<0.0;
#endif
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_21 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_21));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_4 = texture(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat4.x = u_xlat10_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat10_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat28 = dot(u_xlat4.xx, vec2(u_xlat28));
    u_xlat16_3.y = 0.0;
    u_xlat10_4 = texture(_CurveLumVsSat, u_xlat16_3.xy).x;
    u_xlat4.x = u_xlat10_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat28 * u_xlat4.x;
    u_xlat28 = dot(_HueSatCon.yy, vec2(u_xlat28));
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat1.xyz + vec3(u_xlat16_21);
    u_xlat16_2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat16_2.x = max(u_xlat1.z, u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = float(1.0) / float(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_2.xxx + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveMaster, u_xlat0.xw).x;
    u_xlat1.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat10.x = texture(_CurveMaster, u_xlat0.yw).x;
    u_xlat10.y = texture(_CurveMaster, u_xlat0.zw).x;
    u_xlat1.yz = u_xlat10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.yz = min(max(u_xlat1.yz, 0.0), 1.0);
#else
    u_xlat1.yz = clamp(u_xlat1.yz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveRed, u_xlat0.xw).x;
    u_xlat1.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat10.x = texture(_CurveGreen, u_xlat0.yw).x;
    u_xlat10.y = texture(_CurveBlue, u_xlat0.zw).x;
    u_xlat1.yz = u_xlat10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.yz = min(max(u_xlat1.yz, 0.0), 1.0);
#else
    u_xlat1.yz = clamp(u_xlat1.yz, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat16_2.x = max(u_xlat1.z, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = float(1.0) / float(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat1.xyz, vec3(435.187134, 435.187134, 435.187134));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.262677222, 0.262677222, 0.262677222) + vec3(0.0695999935, 0.0695999935, 0.0695999935);
    u_xlat16_8.xyz = u_xlat16_2.xyz * vec3(1.31338608, 1.31338608, 1.31338608);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.262677222, 0.262677222, 0.262677222) + vec3(0.289999992, 0.289999992, 0.289999992);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz + vec3(0.0816000104, 0.0816000104, 0.0816000104);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + vec3(0.00543999998, 0.00543999998, 0.00543999998);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0666666627, -0.0666666627, -0.0666666627);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.31338608, 1.31338608, 1.31338608);
    SV_Target0.xyz = u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
}
}