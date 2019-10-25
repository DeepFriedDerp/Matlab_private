function [aeroForces] = paramSpace_1_1_1_1_1_2_2(sailStates,airStates)

	CL = (3.790771)*sailStates.alpha + (-0.133658)*sailStates.beta + (-2.529014)*sailStates.p + (34.816696)*sailStates.q + (-0.456145)*sailStates.r + (0.010509)*sailStates.de;
	CD = 0.063190;
	CY = (-0.202043)*sailStates.alpha + (-0.020207)*sailStates.beta + (0.050318)*sailStates.p + (-1.671348)*sailStates.q + (0.009031)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.229439)*sailStates.alpha + (0.013644)*sailStates.beta + (-1.236066)*sailStates.p + (10.276778)*sailStates.q + (-0.286738)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-13.768358)*sailStates.alpha + (0.566839)*sailStates.beta + (8.757857)*sailStates.p + (-136.726761)*sailStates.q + (1.611406)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.393872)*sailStates.alpha + (-0.001707)*sailStates.beta + (-0.265433)*sailStates.p + (3.264496)*sailStates.q + (-0.059382)*sailStates.r + (0.000505)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end