function [aeroForces] = paramSpace_10_1_4_2_1_1_1(sailStates,airStates)

	CL = (4.073147)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.334006)*sailStates.p + (32.638474)*sailStates.q + (-0.091605)*sailStates.r + (0.010766)*sailStates.de;
	CD = -0.037180;
	CY = (-0.035228)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.093686)*sailStates.p + (-0.351850)*sailStates.q + (0.006514)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.142426)*sailStates.alpha + (0.061058)*sailStates.beta + (-1.026010)*sailStates.p + (8.003284)*sailStates.q + (-0.159782)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.762320)*sailStates.alpha + (0.000000)*sailStates.beta + (8.113129)*sailStates.p + (-131.203201)*sailStates.q + (0.284150)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (-0.118777)*sailStates.alpha + (-0.004270)*sailStates.beta + (0.298765)*sailStates.p + (-1.418510)*sailStates.q + (-0.004895)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end