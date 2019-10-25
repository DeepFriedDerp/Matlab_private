function [aeroForces] = paramSpace_4_2_1_2_3_2_2(sailStates,airStates)

	CL = (3.873974)*sailStates.alpha + (0.049278)*sailStates.beta + (-2.503574)*sailStates.p + (35.084553)*sailStates.q + (0.779844)*sailStates.r + (0.010771)*sailStates.de;
	CD = 0.065810;
	CY = (0.094297)*sailStates.alpha + (-0.024251)*sailStates.beta + (0.079779)*sailStates.p + (0.756269)*sailStates.q + (-0.015950)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.186342)*sailStates.alpha + (-0.052935)*sailStates.beta + (-1.193286)*sailStates.p + (10.062554)*sailStates.q + (0.486224)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-14.051177)*sailStates.alpha + (-0.151387)*sailStates.beta + (8.445181)*sailStates.p + (-135.926239)*sailStates.q + (-2.614954)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.250562)*sailStates.alpha + (0.011840)*sailStates.beta + (-0.019087)*sailStates.p + (-1.096126)*sailStates.q + (-0.045879)*sailStates.r + (-0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end