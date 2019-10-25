function [aeroForces] = paramSpace_1_2_1_3_1_2_1(sailStates,airStates)

	CL = (3.824126)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.262012)*sailStates.p + (33.097809)*sailStates.q + (-0.675001)*sailStates.r + (0.010527)*sailStates.de;
	CD = 0.081800;
	CY = (-0.070645)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.111600)*sailStates.p + (-0.665001)*sailStates.q + (-0.019615)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.054843)*sailStates.alpha + (0.082321)*sailStates.beta + (-0.975001)*sailStates.p + (7.888365)*sailStates.q + (-0.458356)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-13.708775)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.631750)*sailStates.p + (-129.097870)*sailStates.q + (2.316080)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.133386)*sailStates.alpha + (0.014515)*sailStates.beta + (0.117555)*sailStates.p + (0.536465)*sailStates.q + (-0.030084)*sailStates.r + (0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end