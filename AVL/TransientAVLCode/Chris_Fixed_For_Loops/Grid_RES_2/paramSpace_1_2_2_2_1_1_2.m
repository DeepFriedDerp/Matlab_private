function [aeroForces] = paramSpace_1_2_2_2_1_1_2(sailStates,airStates)

	CL = (5.288270)*sailStates.alpha + (-0.794498)*sailStates.beta + (-5.963913)*sailStates.p + (54.870541)*sailStates.q + (2.378844)*sailStates.r + (0.011114)*sailStates.de;
	CD = -7.598000;
	CY = (2.611946)*sailStates.alpha + (-0.019442)*sailStates.beta + (1.373080)*sailStates.p + (4.144082)*sailStates.q + (0.181943)*sailStates.r + (0.000940)*sailStates.de;

	Cl = (-1.247833)*sailStates.alpha + (-0.991662)*sailStates.beta + (-4.081014)*sailStates.p + (35.050945)*sailStates.q + (2.621294)*sailStates.r + (0.005306)*sailStates.de;
	Cm = (5.855698)*sailStates.alpha + (3.464348)*sailStates.beta + (22.288565)*sailStates.p + (-236.186920)*sailStates.q + (-8.145131)*sailStates.r + (-0.081906)*sailStates.de;
	Cn = (-9.671282)*sailStates.alpha + (-0.098406)*sailStates.beta + (-3.702220)*sailStates.p + (15.601272)*sailStates.q + (-0.076200)*sailStates.r + (-0.000842)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end