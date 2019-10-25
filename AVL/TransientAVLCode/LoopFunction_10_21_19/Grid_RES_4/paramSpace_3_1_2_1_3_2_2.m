function [aeroForces] = paramSpace_3_1_2_1_3_2_2(sailStates,airStates)

	CL = (4.081657)*sailStates.alpha + (-0.002943)*sailStates.beta + (-2.564294)*sailStates.p + (34.601128)*sailStates.q + (-0.115726)*sailStates.r + (0.010892)*sailStates.de;
	CD = -0.014340;
	CY = (0.207018)*sailStates.alpha + (-0.023158)*sailStates.beta + (-0.206194)*sailStates.p + (1.693497)*sailStates.q + (0.013455)*sailStates.r + (0.000363)*sailStates.de;

	Cl = (1.381665)*sailStates.alpha + (0.027116)*sailStates.beta + (-1.258363)*sailStates.p + (10.286443)*sailStates.q + (-0.143117)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-14.776964)*sailStates.alpha + (0.026649)*sailStates.beta + (8.886050)*sailStates.p + (-136.946671)*sailStates.q + (0.380194)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.319132)*sailStates.alpha + (-0.004804)*sailStates.beta + (0.475415)*sailStates.p + (-3.617487)*sailStates.q + (-0.016318)*sailStates.r + (-0.000513)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end