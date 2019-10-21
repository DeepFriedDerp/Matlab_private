function [aeroForces] = paramSpace_1_1_1_1_3_1_1(sailStates,airStates)

	CL = (0.553341)*sailStates.alpha + (0.088636)*sailStates.beta + (-5.917574)*sailStates.p + (57.531292)*sailStates.q + (0.295970)*sailStates.r + (0.011204)*sailStates.de;
	CD = -2.182160;
	CY = (1.142955)*sailStates.alpha + (-0.029083)*sailStates.beta + (0.509837)*sailStates.p + (2.976932)*sailStates.q + (0.089615)*sailStates.r + (0.000675)*sailStates.de;

	Cl = (-1.277890)*sailStates.alpha + (-0.383885)*sailStates.beta + (-4.089486)*sailStates.p + (36.260361)*sailStates.q + (0.623013)*sailStates.r + (0.005459)*sailStates.de;
	Cm = (4.077963)*sailStates.alpha + (-0.366515)*sailStates.beta + (21.407290)*sailStates.p + (-235.363052)*sailStates.q + (-0.861278)*sailStates.r + (-0.081786)*sailStates.de;
	Cn = (-4.333080)*sailStates.alpha + (-0.072799)*sailStates.beta + (-1.962416)*sailStates.p + (9.913564)*sailStates.q + (-0.108754)*sailStates.r + (-0.000574)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end