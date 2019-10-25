function [aeroForces] = paramSpace_4_1_3_1_3_2_1(sailStates,airStates)

	CL = (3.563215)*sailStates.alpha + (0.107892)*sailStates.beta + (-1.657930)*sailStates.p + (27.498575)*sailStates.q + (0.213474)*sailStates.r + (0.010053)*sailStates.de;
	CD = 0.035170;
	CY = (0.329370)*sailStates.alpha + (-0.017140)*sailStates.beta + (-0.142645)*sailStates.p + (2.326710)*sailStates.q + (0.028457)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (0.676062)*sailStates.alpha + (-0.016113)*sailStates.beta + (-0.532310)*sailStates.p + (3.602712)*sailStates.q + (0.062402)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-13.165077)*sailStates.alpha + (-0.446338)*sailStates.beta + (5.923091)*sailStates.p + (-112.315697)*sailStates.q + (-0.793248)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-0.492167)*sailStates.alpha + (-0.005660)*sailStates.beta + (0.331046)*sailStates.p + (-3.397568)*sailStates.q + (-0.057351)*sailStates.r + (-0.000681)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end