function [aeroForces] = paramSpace_11_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.053928)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.310488)*sailStates.p + (32.347511)*sailStates.q + (0.059807)*sailStates.r + (0.010650)*sailStates.de;
	CD = -0.041290;
	CY = (-0.033203)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.072993)*sailStates.p + (-0.322048)*sailStates.q + (0.007660)*sailStates.r + (-0.000069)*sailStates.de;

	Cl = (1.131168)*sailStates.alpha + (0.049469)*sailStates.beta + (-1.015332)*sailStates.p + (7.936500)*sailStates.q + (-0.075433)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-14.768802)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.058026)*sailStates.p + (-130.700150)*sailStates.q + (-0.214749)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (-0.129803)*sailStates.alpha + (-0.005199)*sailStates.beta + (0.269397)*sailStates.p + (-1.308077)*sailStates.q + (-0.009174)*sailStates.r + (0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end