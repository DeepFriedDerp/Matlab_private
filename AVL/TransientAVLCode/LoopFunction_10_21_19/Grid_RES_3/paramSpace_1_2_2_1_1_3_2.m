function [aeroForces] = paramSpace_1_2_2_1_1_3_2(sailStates,airStates)

	CL = (6.782816)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.394866)*sailStates.p + (27.937027)*sailStates.q + (1.794347)*sailStates.r + (0.009351)*sailStates.de;
	CD = -2.611100;
	CY = (-0.170084)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.104616)*sailStates.p + (-1.671351)*sailStates.q + (0.194774)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (2.467554)*sailStates.alpha + (-0.485638)*sailStates.beta + (-1.154053)*sailStates.p + (7.946510)*sailStates.q + (1.834287)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-18.276285)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.136487)*sailStates.p + (-137.643188)*sailStates.q + (-5.868234)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.866051)*sailStates.alpha + (-0.085631)*sailStates.beta + (-2.635617)*sailStates.p + (13.753408)*sailStates.q + (-0.105415)*sailStates.r + (0.000696)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end