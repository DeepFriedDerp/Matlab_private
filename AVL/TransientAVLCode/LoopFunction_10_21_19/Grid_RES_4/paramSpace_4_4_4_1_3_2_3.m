function [aeroForces] = paramSpace_4_4_4_1_3_2_3(sailStates,airStates)

	CL = (3.254346)*sailStates.alpha + (-0.223198)*sailStates.beta + (-3.361183)*sailStates.p + (42.077614)*sailStates.q + (0.910378)*sailStates.r + (0.010801)*sailStates.de;
	CD = 0.117560;
	CY = (0.154560)*sailStates.alpha + (-0.028288)*sailStates.beta + (0.082648)*sailStates.p + (1.002333)*sailStates.q + (-0.016332)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (1.114229)*sailStates.alpha + (-0.148854)*sailStates.beta + (-1.836529)*sailStates.p + (15.891030)*sailStates.q + (0.629829)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-11.872663)*sailStates.alpha + (0.899655)*sailStates.beta + (11.414202)*sailStates.p + (-160.076111)*sailStates.q + (-3.139461)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.459223)*sailStates.alpha + (0.028304)*sailStates.beta + (0.128977)*sailStates.p + (-2.803678)*sailStates.q + (-0.078716)*sailStates.r + (-0.000307)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end