function [aeroForces] = paramSpace_1_2_2_2_1_2_2(sailStates,airStates)

	CL = (3.879053)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.522739)*sailStates.p + (35.131023)*sailStates.q + (-0.685274)*sailStates.r + (0.010754)*sailStates.de;
	CD = 0.065800;
	CY = (-0.094594)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.077152)*sailStates.p + (-0.759372)*sailStates.q + (-0.013604)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.178410)*sailStates.alpha + (0.068867)*sailStates.beta + (-1.187143)*sailStates.p + (9.852871)*sailStates.q + (-0.444339)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-14.003608)*sailStates.alpha + (0.000000)*sailStates.beta + (8.547816)*sailStates.p + (-136.489655)*sailStates.q + (2.328827)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.232996)*sailStates.alpha + (0.012143)*sailStates.beta + (0.019807)*sailStates.p + (1.113274)*sailStates.q + (-0.037947)*sailStates.r + (0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end