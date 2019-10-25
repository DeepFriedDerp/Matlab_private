function [aeroForces] = paramSpace_4_3_2_1_2_2_2(sailStates,airStates)

	CL = (3.893631)*sailStates.alpha + (-0.065312)*sailStates.beta + (-2.480508)*sailStates.p + (35.257782)*sailStates.q + (0.982143)*sailStates.r + (0.010679)*sailStates.de;
	CD = 0.062640;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.214451)*sailStates.p + (-0.000000)*sailStates.q + (-0.042657)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.179644)*sailStates.alpha + (-0.128111)*sailStates.beta + (-1.147488)*sailStates.p + (9.707217)*sailStates.q + (0.662466)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-13.790879)*sailStates.alpha + (0.225417)*sailStates.beta + (8.176367)*sailStates.p + (-134.847153)*sailStates.q + (-3.289625)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.107097)*sailStates.alpha + (0.022297)*sailStates.beta + (-0.300696)*sailStates.p + (0.714751)*sailStates.q + (-0.026594)*sailStates.r + (0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end