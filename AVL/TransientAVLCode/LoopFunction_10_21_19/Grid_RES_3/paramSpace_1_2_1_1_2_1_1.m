function [aeroForces] = paramSpace_1_2_1_1_2_1_1(sailStates,airStates)

	CL = (6.252743)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.794249)*sailStates.p + (35.117798)*sailStates.q + (-2.829534)*sailStates.r + (0.011646)*sailStates.de;
	CD = -2.363420;
	CY = (0.351892)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.159689)*sailStates.p + (-0.589409)*sailStates.q + (-0.204428)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (1.319005)*sailStates.alpha + (0.603351)*sailStates.beta + (-0.517474)*sailStates.p + (5.024985)*sailStates.q + (-2.470894)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-9.621943)*sailStates.alpha + (-0.000000)*sailStates.beta + (4.196819)*sailStates.p + (-111.551048)*sailStates.q + (9.433664)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (-2.028185)*sailStates.alpha + (0.106387)*sailStates.beta + (2.581825)*sailStates.p + (-11.041017)*sailStates.q + (0.035273)*sailStates.r + (0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end