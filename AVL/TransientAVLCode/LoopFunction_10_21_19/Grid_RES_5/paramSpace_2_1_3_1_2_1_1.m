function [aeroForces] = paramSpace_2_1_3_1_2_1_1(sailStates,airStates)

	CL = (5.227906)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.055086)*sailStates.p + (36.182449)*sailStates.q + (-2.382300)*sailStates.r + (0.011362)*sailStates.de;
	CD = -1.014590;
	CY = (0.279695)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.909544)*sailStates.p + (0.550477)*sailStates.q + (-0.193310)*sailStates.r + (0.000115)*sailStates.de;

	Cl = (1.562558)*sailStates.alpha + (0.432960)*sailStates.beta + (-0.770307)*sailStates.p + (7.385049)*sailStates.q + (-1.943978)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-11.730764)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.270083)*sailStates.p + (-119.415161)*sailStates.q + (7.848021)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (-1.031807)*sailStates.alpha + (0.092028)*sailStates.beta + (1.944299)*sailStates.p + (-8.851226)*sailStates.q + (0.034826)*sailStates.r + (-0.000295)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end