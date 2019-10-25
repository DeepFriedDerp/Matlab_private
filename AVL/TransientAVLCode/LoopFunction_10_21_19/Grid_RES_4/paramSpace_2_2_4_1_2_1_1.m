function [aeroForces] = paramSpace_2_2_4_1_2_1_1(sailStates,airStates)

	CL = (6.162403)*sailStates.alpha + (-0.180295)*sailStates.beta + (-1.740193)*sailStates.p + (30.435907)*sailStates.q + (-2.428284)*sailStates.r + (0.011221)*sailStates.de;
	CD = -2.275630;
	CY = (0.362835)*sailStates.alpha + (-0.024921)*sailStates.beta + (-1.067605)*sailStates.p + (-0.221996)*sailStates.q + (-0.069998)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.288027)*sailStates.alpha + (0.489974)*sailStates.beta + (-0.520138)*sailStates.p + (3.983057)*sailStates.q + (-2.179160)*sailStates.r + (-0.000761)*sailStates.de;
	Cm = (-12.638269)*sailStates.alpha + (0.678046)*sailStates.beta + (5.313663)*sailStates.p + (-112.898659)*sailStates.q + (8.210629)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-1.975777)*sailStates.alpha + (0.036531)*sailStates.beta + (2.399490)*sailStates.p + (-10.853888)*sailStates.q + (0.016537)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end