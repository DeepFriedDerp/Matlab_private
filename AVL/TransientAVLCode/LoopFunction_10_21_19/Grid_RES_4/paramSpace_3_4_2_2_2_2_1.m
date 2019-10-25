function [aeroForces] = paramSpace_3_4_2_2_2_2_1(sailStates,airStates)

	CL = (3.944499)*sailStates.alpha + (-0.051242)*sailStates.beta + (-2.145027)*sailStates.p + (31.436073)*sailStates.q + (0.274172)*sailStates.r + (0.010703)*sailStates.de;
	CD = 0.027810;
	CY = (0.003945)*sailStates.alpha + (-0.024883)*sailStates.beta + (0.051345)*sailStates.p + (0.100923)*sailStates.q + (-0.003369)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (0.923319)*sailStates.alpha + (-0.045262)*sailStates.beta + (-0.821491)*sailStates.p + (6.058590)*sailStates.q + (0.168951)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.335246)*sailStates.alpha + (0.158629)*sailStates.beta + (7.348819)*sailStates.p + (-125.105080)*sailStates.q + (-0.921878)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.009150)*sailStates.alpha + (0.002174)*sailStates.beta + (-0.081392)*sailStates.p + (0.237379)*sailStates.q + (-0.002236)*sailStates.r + (-0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end