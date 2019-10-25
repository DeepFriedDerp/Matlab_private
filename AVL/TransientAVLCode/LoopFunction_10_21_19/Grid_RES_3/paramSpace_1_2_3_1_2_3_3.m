function [aeroForces] = paramSpace_1_2_3_1_2_3_3(sailStates,airStates)

	CL = (5.564766)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.211691)*sailStates.p + (35.365154)*sailStates.q + (1.071557)*sailStates.r + (0.009889)*sailStates.de;
	CD = -2.005240;
	CY = (0.352110)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.763654)*sailStates.p + (0.589409)*sailStates.q + (0.134709)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (1.802186)*sailStates.alpha + (-0.405343)*sailStates.beta + (-1.832102)*sailStates.p + (14.751286)*sailStates.q + (1.264090)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-15.272738)*sailStates.alpha + (0.000000)*sailStates.beta + (12.439918)*sailStates.p + (-159.507309)*sailStates.q + (-3.526911)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (-0.694309)*sailStates.alpha + (-0.071473)*sailStates.beta + (-2.035042)*sailStates.p + (9.822291)*sailStates.q + (-0.079390)*sailStates.r + (0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end