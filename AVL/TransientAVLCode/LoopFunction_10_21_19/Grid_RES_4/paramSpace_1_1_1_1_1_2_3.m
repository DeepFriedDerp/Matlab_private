function [aeroForces] = paramSpace_1_1_1_1_1_2_3(sailStates,airStates)

	CL = (3.254346)*sailStates.alpha + (-0.223198)*sailStates.beta + (-3.361183)*sailStates.p + (42.077606)*sailStates.q + (-0.910378)*sailStates.r + (0.010801)*sailStates.de;
	CD = 0.117560;
	CY = (-0.154560)*sailStates.alpha + (-0.021284)*sailStates.beta + (-0.082648)*sailStates.p + (-1.002333)*sailStates.q + (-0.016332)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.215847)*sailStates.alpha + (0.007873)*sailStates.beta + (-1.930886)*sailStates.p + (17.078905)*sailStates.q + (-0.648726)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-11.872662)*sailStates.alpha + (0.899654)*sailStates.beta + (11.414203)*sailStates.p + (-160.076126)*sailStates.q + (3.139462)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (0.501454)*sailStates.alpha + (0.002871)*sailStates.beta + (-0.147746)*sailStates.p + (3.039961)*sailStates.q + (-0.082474)*sailStates.r + (0.000307)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end