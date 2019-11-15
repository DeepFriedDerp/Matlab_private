function [aeroForces] = paramSpace_2_3_3_3_2_1_2(sailStates,airStates)

	CL = (4.298396)*sailStates.alpha + (0.070493)*sailStates.beta + (-2.583809)*sailStates.p + (35.741596)*sailStates.q + (-0.981648)*sailStates.r + (0.011213)*sailStates.de;
	CD = -0.185610;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.376455)*sailStates.p + (-0.000000)*sailStates.q + (-0.024674)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.298889)*sailStates.alpha + (0.209302)*sailStates.beta + (-1.197160)*sailStates.p + (9.790451)*sailStates.q + (-0.826157)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.426082)*sailStates.alpha + (-0.260971)*sailStates.beta + (8.613321)*sailStates.p + (-137.194580)*sailStates.q + (3.316804)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.083172)*sailStates.alpha + (0.012109)*sailStates.beta + (0.784128)*sailStates.p + (-3.385185)*sailStates.q + (0.002366)*sailStates.r + (-0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end