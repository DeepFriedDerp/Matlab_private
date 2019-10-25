function [aeroForces] = paramSpace_1_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.415970)*sailStates.alpha + (-0.472579)*sailStates.beta + (-2.537405)*sailStates.p + (38.688259)*sailStates.q + (-2.014351)*sailStates.r + (0.011052)*sailStates.de;
	CD = -0.483520;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.710214)*sailStates.p + (0.000001)*sailStates.q + (-0.141270)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.438977)*sailStates.alpha + (0.219096)*sailStates.beta + (-1.225320)*sailStates.p + (11.379754)*sailStates.q + (-1.665048)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-11.813119)*sailStates.alpha + (1.840001)*sailStates.beta + (7.426093)*sailStates.p + (-133.820877)*sailStates.q + (6.723645)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.034426)*sailStates.alpha + (0.071094)*sailStates.beta + (1.395634)*sailStates.p + (-5.355632)*sailStates.q + (-0.005423)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end