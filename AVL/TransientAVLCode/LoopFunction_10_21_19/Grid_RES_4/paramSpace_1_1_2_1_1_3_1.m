function [aeroForces] = paramSpace_1_1_2_1_1_3_1(sailStates,airStates)

	CL = (6.386078)*sailStates.alpha + (0.415200)*sailStates.beta + (-1.487966)*sailStates.p + (19.566462)*sailStates.q + (2.038713)*sailStates.r + (0.008513)*sailStates.de;
	CD = -2.636950;
	CY = (-0.669337)*sailStates.alpha + (-0.017140)*sailStates.beta + (1.174666)*sailStates.p + (-2.326710)*sailStates.q + (0.233739)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (1.944030)*sailStates.alpha + (-0.348689)*sailStates.beta + (-0.478535)*sailStates.p + (1.508472)*sailStates.q + (2.026109)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-18.076294)*sailStates.alpha + (-1.551527)*sailStates.beta + (7.395638)*sailStates.p + (-112.315697)*sailStates.q + (-6.609745)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (2.536214)*sailStates.alpha + (-0.117593)*sailStates.beta + (-2.679211)*sailStates.p + (13.926023)*sailStates.q + (-0.111094)*sailStates.r + (0.000844)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end