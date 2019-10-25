function [aeroForces] = paramSpace_4_1_3_1_1_2_1(sailStates,airStates)

	CL = (3.738478)*sailStates.alpha + (0.226406)*sailStates.beta + (-1.559719)*sailStates.p + (28.046833)*sailStates.q + (1.065572)*sailStates.r + (0.010046)*sailStates.de;
	CD = -0.029630;
	CY = (-0.277031)*sailStates.alpha + (-0.028080)*sailStates.beta + (0.386318)*sailStates.p + (-1.002334)*sailStates.q + (-0.076879)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.837559)*sailStates.alpha + (-0.091645)*sailStates.beta + (-0.471171)*sailStates.p + (3.776179)*sailStates.q + (0.761907)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-12.338808)*sailStates.alpha + (-0.836637)*sailStates.beta + (4.783283)*sailStates.p + (-107.565659)*sailStates.q + (-3.544550)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (0.720569)*sailStates.alpha + (0.035682)*sailStates.beta + (-0.784926)*sailStates.p + (4.177029)*sailStates.q + (0.023249)*sailStates.r + (0.000320)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end