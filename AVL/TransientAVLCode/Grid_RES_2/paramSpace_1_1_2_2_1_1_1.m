function [aeroForces] = paramSpace_1_1_2_2_1_1_1(sailStates,airStates)

	CL = (6.118256)*sailStates.alpha + (0.322986)*sailStates.beta + (-2.546557)*sailStates.p + (30.918089)*sailStates.q + (-0.003904)*sailStates.r + (0.009197)*sailStates.de;
	CD = -2.567210;
	CY = (1.425845)*sailStates.alpha + (-0.047148)*sailStates.beta + (-0.265107)*sailStates.p + (11.650487)*sailStates.q + (-0.034077)*sailStates.r + (0.002479)*sailStates.de;

	Cl = (-0.064738)*sailStates.alpha + (-0.336420)*sailStates.beta + (-1.397150)*sailStates.p + (11.891193)*sailStates.q + (0.519829)*sailStates.r + (0.000544)*sailStates.de;
	Cm = (-14.493284)*sailStates.alpha + (-1.567054)*sailStates.beta + (8.992585)*sailStates.p + (-136.974838)*sailStates.q + (-0.147000)*sailStates.r + (-0.068289)*sailStates.de;
	Cn = (-1.414764)*sailStates.alpha + (-0.027118)*sailStates.beta + (0.080442)*sailStates.p + (-8.442657)*sailStates.q + (0.101781)*sailStates.r + (-0.003298)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end