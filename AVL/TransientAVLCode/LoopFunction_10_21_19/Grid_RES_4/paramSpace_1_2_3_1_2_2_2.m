function [aeroForces] = paramSpace_1_2_3_1_2_2_2(sailStates,airStates)

	CL = (3.893631)*sailStates.alpha + (-0.065312)*sailStates.beta + (-2.480508)*sailStates.p + (35.257782)*sailStates.q + (-0.982143)*sailStates.r + (0.010679)*sailStates.de;
	CD = 0.062640;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.214451)*sailStates.p + (0.000000)*sailStates.q + (-0.042657)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.226458)*sailStates.alpha + (0.085727)*sailStates.beta + (-1.179031)*sailStates.p + (10.104185)*sailStates.q + (-0.668727)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-13.790879)*sailStates.alpha + (0.225417)*sailStates.beta + (8.176367)*sailStates.p + (-134.847153)*sailStates.q + (3.289625)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.126133)*sailStates.alpha + (0.020238)*sailStates.beta + (0.294421)*sailStates.p + (-0.635789)*sailStates.q + (-0.027839)*sailStates.r + (-0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end