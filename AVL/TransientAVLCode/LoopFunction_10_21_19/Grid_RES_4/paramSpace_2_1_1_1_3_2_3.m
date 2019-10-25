function [aeroForces] = paramSpace_2_1_1_1_3_2_3(sailStates,airStates)

	CL = (3.858131)*sailStates.alpha + (-0.179076)*sailStates.beta + (-3.414296)*sailStates.p + (41.989246)*sailStates.q + (-0.904453)*sailStates.r + (0.011280)*sailStates.de;
	CD = -0.031450;
	CY = (0.092452)*sailStates.alpha + (-0.027437)*sailStates.beta + (-0.407339)*sailStates.p + (1.915493)*sailStates.q + (-0.026901)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.621750)*sailStates.alpha + (0.060439)*sailStates.beta + (-1.959565)*sailStates.p + (17.053499)*sailStates.q + (-0.723220)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-13.591086)*sailStates.alpha + (0.721945)*sailStates.beta + (11.443218)*sailStates.p + (-159.650192)*sailStates.q + (3.075317)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (0.276975)*sailStates.alpha + (0.010775)*sailStates.beta + (0.719730)*sailStates.p + (-4.069562)*sailStates.q + (0.008204)*sailStates.r + (-0.000592)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end