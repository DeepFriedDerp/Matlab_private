function [aeroForces] = paramSpace_1_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.052033)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.796427)*sailStates.p + (25.713982)*sailStates.q + (0.106117)*sailStates.r + (0.009234)*sailStates.de;
	CD = -0.448290;
	CY = (-0.004333)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.262765)*sailStates.p + (0.476205)*sailStates.q + (0.065566)*sailStates.r + (0.000099)*sailStates.de;

	Cl = (0.805899)*sailStates.alpha + (-0.150105)*sailStates.beta + (-0.682827)*sailStates.p + (4.651908)*sailStates.q + (0.407036)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-15.088799)*sailStates.alpha + (0.000000)*sailStates.beta + (6.972998)*sailStates.p + (-118.206032)*sailStates.q + (-0.266147)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (0.471287)*sailStates.alpha + (-0.037425)*sailStates.beta + (-0.734565)*sailStates.p + (3.131104)*sailStates.q + (-0.039644)*sailStates.r + (-0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end