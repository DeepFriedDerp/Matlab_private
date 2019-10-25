function [aeroForces] = paramSpace_4_4_4_2_3_2_3(sailStates,airStates)

	CL = (3.593103)*sailStates.alpha + (-0.229483)*sailStates.beta + (-2.869812)*sailStates.p + (38.264568)*sailStates.q + (0.954698)*sailStates.r + (0.010543)*sailStates.de;
	CD = 0.113550;
	CY = (0.086070)*sailStates.alpha + (-0.026377)*sailStates.beta + (0.169369)*sailStates.p + (0.455226)*sailStates.q + (-0.033641)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.168830)*sailStates.alpha + (-0.166887)*sailStates.beta + (-1.438400)*sailStates.p + (12.264143)*sailStates.q + (0.666924)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-12.878805)*sailStates.alpha + (0.917720)*sailStates.beta + (9.603731)*sailStates.p + (-145.756409)*sailStates.q + (-3.260995)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.321404)*sailStates.alpha + (0.027387)*sailStates.beta + (-0.131304)*sailStates.p + (-0.831555)*sailStates.q + (-0.049978)*sailStates.r + (-0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end