function [aeroForces] = paramSpace_1_3_3_1_3_2_1(sailStates,airStates)

	CL = (3.835528)*sailStates.alpha + (0.069435)*sailStates.beta + (-1.579041)*sailStates.p + (28.267738)*sailStates.q + (-1.066061)*sailStates.r + (0.010288)*sailStates.de;
	CD = -0.040290;
	CY = (0.273258)*sailStates.alpha + (-0.023945)*sailStates.beta + (-0.373861)*sailStates.p + (1.002334)*sailStates.q + (-0.074330)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.728829)*sailStates.alpha + (0.166615)*sailStates.beta + (-0.417328)*sailStates.p + (3.056888)*sailStates.q + (-0.731930)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-12.739534)*sailStates.alpha + (-0.238171)*sailStates.beta + (4.853312)*sailStates.p + (-108.591927)*sailStates.q + (3.530370)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-0.759772)*sailStates.alpha + (0.027412)*sailStates.beta + (0.778497)*sailStates.p + (-4.328468)*sailStates.q + (0.025687)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end