function [aeroForces] = paramSpace_2_2_2_2_1_2_1(sailStates,airStates)

	CL = (5.160970)*sailStates.alpha + (-3.936909)*sailStates.beta + (-3.435015)*sailStates.p + (47.221031)*sailStates.q + (2.183522)*sailStates.r + (0.010354)*sailStates.de;
	CD = -5.810260;
	CY = (1.759628)*sailStates.alpha + (-0.269880)*sailStates.beta + (0.324339)*sailStates.p + (15.325538)*sailStates.q + (-0.031846)*sailStates.r + (0.002917)*sailStates.de;

	Cl = (-5.376392)*sailStates.alpha + (-1.233313)*sailStates.beta + (-1.663373)*sailStates.p + (14.116595)*sailStates.q + (2.438952)*sailStates.r + (0.001209)*sailStates.de;
	Cm = (5.493866)*sailStates.alpha + (18.039524)*sailStates.beta + (10.688459)*sailStates.p + (-151.051163)*sailStates.q + (-7.785324)*sailStates.r + (-0.055242)*sailStates.de;
	Cn = (-1.805467)*sailStates.alpha + (0.383686)*sailStates.beta + (-0.916977)*sailStates.p + (-8.701752)*sailStates.q + (-0.200696)*sailStates.r + (-0.003844)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end