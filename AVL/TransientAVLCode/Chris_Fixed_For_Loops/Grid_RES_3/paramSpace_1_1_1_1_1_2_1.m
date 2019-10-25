function [aeroForces] = paramSpace_1_1_1_1_1_2_1(sailStates,airStates)

	CL = (3.730637)*sailStates.alpha + (-0.094575)*sailStates.beta + (-2.897622)*sailStates.p + (38.426189)*sailStates.q + (-0.899887)*sailStates.r + (0.010806)*sailStates.de;
	CD = 0.095380;
	CY = (-0.060305)*sailStates.alpha + (-0.024630)*sailStates.beta + (-0.179831)*sailStates.p + (-0.236462)*sailStates.q + (-0.031687)*sailStates.r + (-0.000051)*sailStates.de;

	Cl = (1.312690)*sailStates.alpha + (0.070779)*sailStates.beta + (-1.518866)*sailStates.p + (13.144638)*sailStates.q + (-0.645950)*sailStates.r + (0.000938)*sailStates.de;
	Cm = (-13.368701)*sailStates.alpha + (0.376607)*sailStates.beta + (9.702257)*sailStates.p + (-146.723969)*sailStates.q + (3.069143)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.311029)*sailStates.alpha + (0.015093)*sailStates.beta + (0.163227)*sailStates.p + (0.492002)*sailStates.q + (-0.038145)*sailStates.r + (0.000066)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end