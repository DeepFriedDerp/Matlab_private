function [aeroForces] = paramSpace_2_1_1_1_1_3_2(sailStates,airStates)

	CL = (7.138455)*sailStates.alpha + (0.478598)*sailStates.beta + (-2.505832)*sailStates.p + (31.974852)*sailStates.q + (2.320496)*sailStates.r + (0.010299)*sailStates.de;
	CD = -2.754580;
	CY = (-0.194388)*sailStates.alpha + (-0.022443)*sailStates.beta + (1.226433)*sailStates.p + (-1.693500)*sailStates.q + (0.080563)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (2.732946)*sailStates.alpha + (-0.389463)*sailStates.beta + (-1.239774)*sailStates.p + (9.585863)*sailStates.q + (2.174469)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-17.012268)*sailStates.alpha + (-1.786608)*sailStates.beta + (9.373096)*sailStates.p + (-136.946671)*sailStates.q + (-7.811055)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.690955)*sailStates.alpha + (-0.042808)*sailStates.beta + (-2.789116)*sailStates.p + (14.306252)*sailStates.q + (-0.035400)*sailStates.r + (0.000733)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end