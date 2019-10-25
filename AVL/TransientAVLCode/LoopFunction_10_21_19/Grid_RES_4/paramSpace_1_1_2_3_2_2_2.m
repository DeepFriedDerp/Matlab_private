function [aeroForces] = paramSpace_1_1_2_3_2_2_2(sailStates,airStates)

	CL = (3.795492)*sailStates.alpha + (-0.214494)*sailStates.beta + (-2.460923)*sailStates.p + (35.037689)*sailStates.q + (-0.983104)*sailStates.r + (0.010431)*sailStates.de;
	CD = 0.073860;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.227173)*sailStates.p + (-0.000000)*sailStates.q + (-0.045187)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.252984)*sailStates.alpha + (0.047084)*sailStates.beta + (-1.201245)*sailStates.p + (10.426458)*sailStates.q + (-0.693255)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-13.382873)*sailStates.alpha + (0.801042)*sailStates.beta + (8.104492)*sailStates.p + (-133.820877)*sailStates.q + (3.313102)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.145110)*sailStates.alpha + (0.018893)*sailStates.beta + (0.307541)*sailStates.p + (-0.563091)*sailStates.q + (-0.029222)*sailStates.r + (-0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end