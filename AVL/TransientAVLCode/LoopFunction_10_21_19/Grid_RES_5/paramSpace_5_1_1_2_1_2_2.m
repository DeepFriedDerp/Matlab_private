function [aeroForces] = paramSpace_5_1_1_2_1_2_2(sailStates,airStates)

	CL = (4.072468)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.748092)*sailStates.p + (35.779682)*sailStates.q + (0.053507)*sailStates.r + (0.010807)*sailStates.de;
	CD = -0.068350;
	CY = (-0.024877)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.161767)*sailStates.p + (-0.322048)*sailStates.q + (0.017036)*sailStates.r + (-0.000070)*sailStates.de;

	Cl = (1.367899)*sailStates.alpha + (-0.067912)*sailStates.beta + (-1.370743)*sailStates.p + (11.162881)*sailStates.q + (0.151493)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-14.720432)*sailStates.alpha + (0.000000)*sailStates.beta + (9.611850)*sailStates.p + (-143.031982)*sailStates.q + (-0.134984)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (0.171014)*sailStates.alpha + (-0.007138)*sailStates.beta + (-0.498063)*sailStates.p + (3.087499)*sailStates.q + (-0.021587)*sailStates.r + (0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end