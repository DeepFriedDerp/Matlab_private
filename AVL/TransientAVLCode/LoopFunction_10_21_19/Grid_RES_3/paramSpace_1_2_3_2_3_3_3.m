function [aeroForces] = paramSpace_1_2_3_2_3_3_3(sailStates,airStates)

	CL = (4.124558)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.805536)*sailStates.p + (35.381283)*sailStates.q + (-0.183284)*sailStates.r + (0.010409)*sailStates.de;
	CD = -0.250490;
	CY = (0.146224)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.127948)*sailStates.p + (1.027328)*sailStates.q + (0.022658)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.327591)*sailStates.alpha + (-0.104962)*sailStates.beta + (-1.461347)*sailStates.p + (12.133651)*sailStates.q + (0.101048)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-14.898300)*sailStates.alpha + (0.000000)*sailStates.beta + (9.965182)*sailStates.p + (-145.469635)*sailStates.q + (0.617537)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.037735)*sailStates.alpha + (-0.018508)*sailStates.beta + (-0.536592)*sailStates.p + (2.414048)*sailStates.q + (-0.031785)*sailStates.r + (-0.000264)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end