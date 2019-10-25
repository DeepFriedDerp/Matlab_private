function [aeroForces] = paramSpace_4_2_3_3_3_1_3(sailStates,airStates)

	CL = (3.922668)*sailStates.alpha + (0.019726)*sailStates.beta + (-2.694974)*sailStates.p + (35.033493)*sailStates.q + (0.305029)*sailStates.r + (0.010256)*sailStates.de;
	CD = -0.084950;
	CY = (0.021750)*sailStates.alpha + (-0.024652)*sailStates.beta + (-0.120951)*sailStates.p + (0.294836)*sailStates.q + (0.024069)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.344991)*sailStates.alpha + (0.056446)*sailStates.beta + (-1.377638)*sailStates.p + (11.447610)*sailStates.q + (0.058749)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-14.413009)*sailStates.alpha + (-0.070191)*sailStates.beta + (9.575994)*sailStates.p + (-142.570129)*sailStates.q + (-1.096535)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.257845)*sailStates.alpha + (-0.012662)*sailStates.beta + (0.513743)*sailStates.p + (-3.507750)*sailStates.q + (-0.059402)*sailStates.r + (-0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end