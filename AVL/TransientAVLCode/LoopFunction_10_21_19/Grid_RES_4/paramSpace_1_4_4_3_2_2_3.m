function [aeroForces] = paramSpace_1_4_4_3_2_2_3(sailStates,airStates)

	CL = (3.830156)*sailStates.alpha + (0.186756)*sailStates.beta + (-2.713148)*sailStates.p + (37.077770)*sailStates.q + (-1.066393)*sailStates.r + (0.010730)*sailStates.de;
	CD = 0.062210;
	CY = (-0.000912)*sailStates.alpha + (-0.024227)*sailStates.beta + (-0.229320)*sailStates.p + (0.194781)*sailStates.q + (-0.045594)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.208804)*sailStates.alpha + (0.175604)*sailStates.beta + (-1.313371)*sailStates.p + (11.215877)*sailStates.q + (-0.710075)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-13.657027)*sailStates.alpha + (-0.583319)*sailStates.beta + (8.934079)*sailStates.p + (-140.845245)*sailStates.q + (3.547671)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.180683)*sailStates.alpha + (0.024158)*sailStates.beta + (0.306601)*sailStates.p + (-0.828280)*sailStates.q + (-0.028618)*sailStates.r + (-0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end