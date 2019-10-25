function [aeroForces] = paramSpace_15_1_2_2_2_2_2(sailStates,airStates)

	CL = (3.902849)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.697151)*sailStates.p + (39.542717)*sailStates.q + (1.763765)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.056600;
	CY = (0.072022)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.480464)*sailStates.p + (0.199286)*sailStates.q + (-0.119800)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.235535)*sailStates.alpha + (-0.248065)*sailStates.beta + (-1.328175)*sailStates.p + (12.223970)*sailStates.q + (1.332407)*sailStates.r + (0.000628)*sailStates.de;
	Cm = (-12.179768)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.194846)*sailStates.p + (-139.959488)*sailStates.q + (-5.834599)*sailStates.r + (-0.067023)*sailStates.de;
	Cn = (-0.306995)*sailStates.alpha + (0.061850)*sailStates.beta + (-0.831941)*sailStates.p + (2.485805)*sailStates.q + (-0.042233)*sailStates.r + (0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end