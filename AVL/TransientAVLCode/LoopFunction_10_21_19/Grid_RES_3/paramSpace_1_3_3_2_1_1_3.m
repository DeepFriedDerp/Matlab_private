function [aeroForces] = paramSpace_1_3_3_2_1_1_3(sailStates,airStates)

	CL = (4.185490)*sailStates.alpha + (0.340454)*sailStates.beta + (-2.966718)*sailStates.p + (41.333431)*sailStates.q + (-1.825536)*sailStates.r + (0.011551)*sailStates.de;
	CD = -0.361920;
	CY = (-0.163347)*sailStates.alpha + (-0.025948)*sailStates.beta + (-0.569683)*sailStates.p + (-0.491412)*sailStates.q + (-0.100497)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.239143)*sailStates.alpha + (0.409502)*sailStates.beta + (-1.479656)*sailStates.p + (13.159055)*sailStates.q + (-1.462300)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-12.310378)*sailStates.alpha + (-1.213747)*sailStates.beta + (9.181441)*sailStates.p + (-146.474228)*sailStates.q + (6.076828)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.435612)*sailStates.alpha + (0.054480)*sailStates.beta + (1.095960)*sailStates.p + (-3.832848)*sailStates.q + (-0.018716)*sailStates.r + (0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end