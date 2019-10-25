function [aeroForces] = paramSpace_2_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.124974)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.824265)*sailStates.p + (34.829319)*sailStates.q + (-0.199707)*sailStates.r + (0.009915)*sailStates.de;
	CD = -0.397300;
	CY = (0.195092)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.148731)*sailStates.p + (1.364608)*sailStates.q + (0.031663)*sailStates.r + (0.000291)*sailStates.de;

	Cl = (1.319547)*sailStates.alpha + (-0.128436)*sailStates.beta + (-1.507389)*sailStates.p + (12.588233)*sailStates.q + (0.122402)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-14.725173)*sailStates.alpha + (0.000000)*sailStates.beta + (10.220692)*sailStates.p + (-146.890121)*sailStates.q + (0.725010)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (0.005417)*sailStates.alpha + (-0.027300)*sailStates.beta + (-0.663393)*sailStates.p + (3.047236)*sailStates.q + (-0.047016)*sailStates.r + (-0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end